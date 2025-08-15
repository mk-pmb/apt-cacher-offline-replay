
<!--#echo json="package.json" key="name" underline="=" -->
apt-cacher-offline-replay
=========================
<!--/#echo -->

<!--#echo json="package.json" key="description" -->
Wrap `/usr/lib/apt/methods/http` to pretend to download stuff but try to cope
without actual networking.
<!--/#echo -->



Why?
----

* I want to install Ubuntu a lot, but apt download from the web is too slow.
  Also downloading everything again all the time is rather wasteful.
* I've used `apt-cacher-ng` but it's needlessly complicated to deal with the
  networking aspects just because `apt` doesn't have a config option for
  which download command to use for what URL type.
  (Or at least I couldn't find it.)
* [A little investigation](util/apt-methods-intercept/README.md)
  turned up very promising evidence.




Usage
-----

:TODO:




Known issues
------------

* Needs more/better tests and docs.





<!--#toc stop="scan" -->

&nbsp;


License
-------
<!--#echo json="package.json" key="license" -->
ISC
<!--/#echo -->
