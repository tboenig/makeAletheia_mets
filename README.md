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
- ``imagefile`` - name of the image file folder
- ``pagefile`` - name of the PAGE file folder
- ``noIMAGE=yes`` Indication that no image files can be specified, 
- ``noPAGE=yes`` Indication that no PAGE files can be specified or are available.
