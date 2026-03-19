const express = require('express');
const router = express.Router();
const PublicController = require('../controllers/PublicController');

// 1. Search & List (Card UI)
router.get('/search', PublicController.search);

// 2. Map Data (GeoJSON)
router.get('/map', PublicController.getMapData);

// 3. Stats (Summary)
router.get('/stats', PublicController.getStats);

// 4. Detail Permit
router.get('/permit/:id', PublicController.getDetail);

// Legal Dashboard Endpoint
router.get('/dashboard/legal', PublicController.getLegalDashboardStats);

module.exports = router;
