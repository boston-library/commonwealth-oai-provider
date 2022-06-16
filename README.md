# CommonwealthOaiProvider

Provides an OAI-PMH API for the digital repository maintained by Boston Public Library.

## Dependencies
* **ruby 2.7.6**
* **rails 6.1.6**
* **solr 8.9**

### NOTE
This application does NOT have a database so none of the `$rails db:*` commands should be run

### Running Locally

* Start solr in a terminal

  ```
  $ solr_wrapper --config .solr_wrapper_dev
  ```

* Start server or console in another terminal
  ```
    $ rails s
    $ rails c
  ```

### Running specs

* Simply run
```
$ rails ci
# OR
$ rake
```
