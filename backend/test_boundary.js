require('dotenv').config();
const { SocialForestPermits } = require('./models');
const { Op } = require('sequelize');

async function test() {
    const p = await SocialForestPermits.findOne({ where: { boundary: { [Op.not]: null } } });
    if (!p) {
        console.log('No permit with boundary found');
        return;
    }

    console.log('Location:', JSON.stringify(p.location));
    console.log('Boundary Type:', p.boundary ? typeof p.boundary : 'null');

    if (p.boundary && typeof p.boundary === 'object') {
        console.log('Boundary JSON:', JSON.stringify(p.boundary).substring(0, 150));
        console.log('Boundary GeoType:', p.boundary.type);
        console.log('Boundary Coords Array Length:', p.boundary.coordinates ? p.boundary.coordinates.length : 0);

        if (p.boundary.type === 'MultiPolygon') {
            console.log('MultiPolygon 1st elem len:', p.boundary.coordinates[0][0].length);
            console.log('MultiPolygon 1st point:', p.boundary.coordinates[0][0][0]);
        } else if (p.boundary.type === 'Polygon') {
            console.log('Polygon 1st elem len:', p.boundary.coordinates[0].length);
            console.log('Polygon 1st point:', p.boundary.coordinates[0][0]);
        }
    }
}

test().catch(console.error).finally(() => process.exit(0));
