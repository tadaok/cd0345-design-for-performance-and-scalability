import os
import logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    logger.info("{} from Lambda!".format(os.environ['greeting']))
    return "{} from Lambda!".format(os.environ['greeting'])