# makeAletheia_mets

Build a Mets file (Page Collections file) to easily work with Aletheia.  
See: https://www.primaresearch.org/www/assets/tools/Aletheia%20User%20Guide.pdf#page=123

Requirements for a METS file
------------
- Name of the image file (with file path).
- If available the matching PAGE XML file.
- Both files should have the same name and only differ in their file extension.
- The files should be stored in relevant folders:
  -   e.g. the image files in the folder ``jpg``
  -   and the PAGE XML files in the folder ``page``


Parameters
-------------
- ``imagefolder``name of the image file folder
- ``pagefolder    ``name of the PAGE file folder
- ``noIMAGE=yes``Indication that no image files can be specified, 
- ``noPAGE=yes  ``Indication that no PAGE files can be specified or are available.

The File
-------------

The ``link`` element contains the path to the ``image`` or ``PAGE`` file.
Note: See the example file in the example folder. Use only a slash for seperating the folders, dont use a backslash also when you use the Windows OS.




Transformation
-------------------------------

```sh
java -jar ../saxon9he.jar -xsl:../xsl/makeAletheia_mets -s:../example/example.xml imagefolder=jpg pagefolder=page
```

Variante that no PAGE files can be specified or available:

```sh
java -jar ../saxon9he.jar -xsl:../xsl/makeAletheia_mets -s:../example/example.xml imagefolder=jpg pagefolder=page noPage=yes
```
