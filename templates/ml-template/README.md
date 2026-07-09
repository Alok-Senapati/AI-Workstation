# ML Project Template

A reusable template for machine learning projects.

---

## Project Structure

.
├── configs/
├── data/
│   ├── raw/
│   ├── interim/
│   ├── processed/
│   └── external/
├── notebooks/
├── src/
├── scripts/
├── models/
├── experiments/
├── reports/
└── tests/

---

## Workflow

1. Download datasets into `data/raw`
2. Explore data in `notebooks`
3. Move reusable code into `src`
4. Train models using `scripts/train.py`
5. Save models in `models`
6. Save plots and metrics in `reports`

---

## Development

```bash
make install
make train
make evaluate
make predict
make test
```

---

## License

MIT