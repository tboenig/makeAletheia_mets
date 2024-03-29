# makeAletheia_mets

Build a Mets file (Page Collections file) to easily work with Aletheia.  
**See:** [Page Collections](https://www.primaresearch.org/www/assets/tools/Aletheia%20User%20Guide.pdf#page=123) in the Aletheia User Guide.
You can also use the METS file for the OCR-D framework (https://github.com/OCR-D/core).

Requirements for a METS file
------------
- Name and path of the image file (without file extension).
- If available the matching PAGE XML file.
- Both files should have the same name and only differ in their file extension.
- The files should be stored in relevant folders:
  -   e.g. the image files in the folder ``jpg``
  -   and the PAGE XML files in the folder ``page``


Parameters
-------------
- ``imagefolder``name of the image file folder
- ``pagefolder    ``name of the PAGE file folder
- ``imageFormat``Format of image files  
- ``noIMAGE=yes``Indication that no image files can be specified, 
- ``noPAGE=yes  ``Indication that no PAGE files can be specified or are available
- ``drive             ``The drive letter from windows file system.

The File
-------------

The ``link`` element contains the path to the ``image`` or ``PAGE`` file.  
**Note:** See the example file in the example folder. Use only a slash for seperating the folders, dont use a backslash also when you use the Windows OS.

```
<?xml version="1.0" encoding="UTF-8"?>
<gt>
    <link>[Path to the Image or PAGE file]/[Name of the File without Extension]</link>
</gt>

```


Transformation
-------------------------------

```sh
java -jar ../saxon9he.jar -xsl:../xsl/makeAletheia_mets.xsl -s:../example/example.xml imagefolder=jpg imageFormat=jpg pagefolder=page
```

A variante that no PAGE files can be specified or available:

```sh
java -jar ../saxon9he.jar -xsl:../xsl/makeAletheia_mets.xsl -s:../example/example.xml imagefolder=tiff imageFormat=tif noPage=yes
```
