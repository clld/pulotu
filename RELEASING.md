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
- make sure tests pass.
  ```shell
  pytest
  ```
- commit and push.
- deploy the app.

- Store the tested requirements:
  ```shell
  pip freeze > requirements.txt
  ```

- Store a db dump:
  ```shell
  pg_dump -xO pulotu > pulotu.sql
  zip pulotu.sql.zip pulotu.sql
  rm pulotu.sql
  ```

