# Drupal Module Template with local dev setup based on docker

This Project sets up an docker environment for module development.

Before you start change `MODULES_NAME` in `.env`.
Afterwards run `./startover.sh` from within `scripts/` folder.

While setup you'll be asked the drush setup questions, besides the module name.

Afterwards you have to change the owner from the generated files on your host system. After generation it is root:root.

- Call `composer init` for creating a composer.json file. See: [Add a composer.json file](https://www.drupal.org/docs/develop/creating-modules/add-a-composerjson-file)
- for more information about writing a drupal module see [Creating modules](https://www.drupal.org/docs/develop/creating-modules)