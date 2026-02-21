const express = require('express');
const router = express.Router();
const PriorityController = require('../controllers/PriorityController');

const BiophysicalController = require('../controllers/BiophysicalController');
const CommodityController = require('../controllers/CommodityController');
const SocialController = require('../controllers/SocialController');
const MarketController = require('../controllers/MarketController');
const RiskController = require('../controllers/RiskController');

// Priority Module
router.get('/priority/map', PriorityController.getPriorityMap);
router.get('/priority/detail/:permitId', PriorityController.getPriorityDetail);
router.get('/priority/monitoring/:permitId', PriorityController.getMonitoringLogs);

// Other Modules
router.get('/biophysical/:permitId', BiophysicalController.getBiophysicalData);
router.get('/commodity/:permitId', CommodityController.getCommodityData);
router.get('/social/:permitId', SocialController.getSocialData);
router.get('/market/:permitId', MarketController.getMarketData);
router.get('/risk/:permitId', RiskController.getRiskData);

module.exports = router;
