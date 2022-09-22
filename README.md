# CommonwealthOaiProvider

Provides an OAI-PMH API for the digital repository maintained by Boston Public Library.

## Dependencies
* **ruby 3.0.4**
* **rails 6.1.7**
* **solr 8.11.2**

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

* You can also manually run the rubocop linter by running
  ```
     $ rails rubocop
  ```

* You can run just the specs by running `$ solr_wrapper` in a separate terminal and then run
  `$ rails spec` in another
