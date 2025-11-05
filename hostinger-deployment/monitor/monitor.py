#!/usr/bin/env python3
import os
import time
import requests
import yaml
import logging
from datetime import datetime
import schedule

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('/app/logs/monitor.log'),
        logging.StreamHandler()
    ]
)

# HubSpot domains to monitor
HUBSPOT_DOMAINS = os.getenv('HUBSPOT_DOMAINS', '').split(',')
CHECK_INTERVAL = int(os.getenv('CHECK_INTERVAL', 300))

def check_hubspot_connectivity():
    """Check connectivity to all HubSpot regions"""
    results = {
        'timestamp': datetime.now().isoformat(),
        'checks': []
    }
    
    for domain in HUBSPOT_DOMAINS:
        if not domain:
            continue
            
        try:
            start_time = time.time()
            response = requests.get(
                f'https://{domain}',
                timeout=10,
                verify=True
            )
            response_time = time.time() - start_time
            
            status = {
                'domain': domain,
                'status': 'OK' if response.status_code < 500 else 'ERROR',
                'status_code': response.status_code,
                'response_time': round(response_time, 2)
            }
            
            logging.info(f"✓ {domain}: {status['status']} ({status['response_time']}s)")
            
        except requests.exceptions.RequestException as e:
            status = {
                'domain': domain,
                'status': 'FAILED',
                'error': str(e),
                'response_time': None
            }
            logging.error(f"✗ {domain}: FAILED - {e}")
        
        results['checks'].append(status)
    
    return results

def check_smtp_ports():
    """Check SMTP port connectivity"""
    import socket
    
    smtp_domains = [
        ('bf.hubspot-inbox.com', 587),
        ('bf.hubspot-inbox.com', 25),
    ]
    
    for domain, port in smtp_domains:
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(5)
            result = sock.connect_ex((domain, port))
            sock.close()
            
            if result == 0:
                logging.info(f"✓ SMTP {domain}:{port} - OK")
            else:
                logging.warning(f"✗ SMTP {domain}:{port} - FAILED")
                
        except Exception as e:
            logging.error(f"✗ SMTP {domain}:{port} - ERROR: {e}")

def run_checks():
    """Run all monitoring checks"""
    logging.info("=" * 60)
    logging.info("Starting HubSpot Connectivity Checks")
    logging.info("=" * 60)
    
    # Check HTTPS connectivity
    check_hubspot_connectivity()
    
    # Check SMTP ports
    check_smtp_ports()
    
    logging.info("=" * 60)
    logging.info(f"Next check in {CHECK_INTERVAL} seconds")
    logging.info("=" * 60)

if __name__ == '__main__':
    logging.info("HubSpot Monitor Service Started")
    logging.info(f"Monitoring domains: {HUBSPOT_DOMAINS}")
    logging.info(f"Check interval: {CHECK_INTERVAL} seconds")
    
    # Run immediately on start
    run_checks()
    
    # Schedule regular checks
    schedule.every(CHECK_INTERVAL).seconds.do(run_checks)
    
    while True:
        schedule.run_pending()
        time.sleep(1)
