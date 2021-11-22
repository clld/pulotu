# Releasing clld/pulotu

* data is located [here](https://github.com/D-PLACE/dplace-dataset-pulotu)

* create the database (with data repo in `./pulotu-data/`)
  ```
  clld initdb --cldf ./pulotu-data/cldf/StructureDataset-metadata.json development.ini
  ```

* run tests
  ```
  pytest
  ```

* deploy
  ```
  (appconfig)$ fab deploy:production
  ```
