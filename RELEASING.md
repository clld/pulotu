# Releasing pulotu.com

- Install from source:
  ```shell
  git clone https://github.com/clld/pulotu
  cd pulotu
  pip install -e .[test] 
  ```

- recreate the database:
  ```shell
  clld initdb development.ini --cldf ../dplace-dataset-pulotu/cldf/StructureDataset-metadata.json
  ```
