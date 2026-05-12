const express = require('express');
const router = express.Router();
const PublicController = require('../controllers/PublicController');
const KupsController = require('../controllers/KupsController');

// 1. Search & List (Card UI)
router.get('/search', PublicController.search);

// 2. Map Data (GeoJSON)
router.get('/map', PublicController.getMapData);

// 3. Stats (Summary)
router.get('/stats', PublicController.getStats);

// 4. Detail Permit
router.get('/permit/:id', PublicController.getDetail);

// 5. Legal Dashboard Endpoint
router.get('/dashboard/legal', PublicController.getLegalDashboardStats);

// 6. KUPS Routes
router.get('/kups', KupsController.search);
router.get('/kups/filters', KupsController.getFilters);

module.exports = router;
