# makeAletheia_mets

Build a Mets file (Page Collections file) to easily work with Aletheia.

Requirements for a METS file:
------------
- Name of the image file (with file path).
- If available the matching PAGE XML file.
- Both files should have the same name and only differ in their file extension.
- The files should be stored in relevant folders:
  -   e.g. the image files in the folder ``jpg``
  -   and the PAGE XML files in the folder ``page``


Parameters:
-------------
- ``imagefolder``name of the image file folder
- ``pagefolder    ``name of the PAGE file folder
- ``noIMAGE=yes``Indication that no image files can be specified, 
- ``noPAGE=yes  ``Indication that no PAGE files can be specified or are available.

Transformation
-------------------------------

``java -jar ../saxon9he.jar -xsl:../xsl/makeAletheia_mets -s:../example/example.xml imagefolder=jpg pagefolder=page``

Variante that no PAGE files can be specified or available:

``java -jar ../saxon9he.jar -xsl:../xsl/makeAletheia_mets -s:../example/example.xml imagefolder=jpg pagefolder=page noPage=yes``
