// server.js (또는 index.js)
import express from 'express';
import cors from 'cors';
import { Pool } from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const app = express();
app.use(cors());

const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'bread_map',
  password: process.env.DB_PASSWORD,
  port: 5432,
});

app.get('/country-info', async (req, res) => {
    const countryName = req.query.name;
    try {
        const result = await pool.query(
            'SELECT * FROM bread WHERE country = $1',
            [countryName]
        );
        res.json(result.rows);
    } catch (err) {
        console.log(process.env.VITE_DB_KEY)
        console.error('DB 오류:', err);  // ← 콘솔 출력 확인
        res.status(500).send('Server Error');
    }
});

const PORT = 5000;
app.listen(PORT, () => {
  console.log(`Backend server listening on http://localhost:${PORT}`);
});
