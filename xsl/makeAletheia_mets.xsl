<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns="http://www.loc.gov/METS/"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:param name="imagefile"/>
    <xsl:param name="pagefile"/>
    
    
    
   <xsl:template match="gt"> 
    <mets xmlns="http://www.loc.gov/METS/" 
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
        xmlns:xlink="http://www.w3.org/1999/xlink" 
        xsi:schemaLocation="http://www.loc.gov/METS/ http://www.loc.gov/standards/mets/version18/mets.xsd">
        <metsHdr CREATEDATE="2019-02-20T10:10:14" LASTMODDATE="2019-02-20T10:10:14"/>
        <fileSec>
            <fileGrp USE="PageContent">
                <xsl:apply-templates mode="Link1"/>
            </fileGrp>
            <fileGrp USE="Binary"/>
           
            <fileGrp USE="Master">
                <xsl:apply-templates mode="Link2" />
            </fileGrp>
        </fileSec>
        <structMap TYPE="physical">
            <div TYPE="sequence">
        <xsl:apply-templates mode="Link3"/>
            </div>
        </structMap>
    </mets>
   </xsl:template>
    
    <xsl:template match="link" mode="Link1">
        <xsl:element name="file" >
            <xsl:attribute name="ID">PageContent.<xsl:number level="single" count="link" format="1"/></xsl:attribute>
            <FLocat xlink:type="simple" LOCTYPE="URL">
                <xsl:variable name="test"><xsl:apply-templates/></xsl:variable>
                <xsl:message select="$test"></xsl:message>
                <xsl:attribute name="xlink:href"><xsl:value-of select="replace($test, $imagefile, $pagefile)"/>.xml</xsl:attribute>
                <!--<xsl:attribute name="xlink:href"><xsl:apply-templates/>.xml</xsl:attribute>-->
            </FLocat>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="link" mode="Link2">
        <file>
            <xsl:attribute name="ID">Master.<xsl:number level="single" count="link" format="1"/></xsl:attribute>
            <FLocat xlink:type="simple" LOCTYPE="URL">
                <xsl:attribute name="xlink:href"><xsl:apply-templates/>.jpg</xsl:attribute>
            </FLocat>
        </file>
    </xsl:template>
  
  <xsl:template match="link" mode="Link3">

              <div>
                  <xsl:attribute name="ID">physical.<xsl:number level="single" count="link" format="1"/></xsl:attribute>
                  <xsl:attribute name="TYPE">page</xsl:attribute>
                  <xsl:attribute name="ORDER"><xsl:number level="single" count="link" format="1"/></xsl:attribute>
                  <fptr><xsl:attribute name="FILEID">Master.<xsl:number level="single" count="link" format="1"/></xsl:attribute></fptr>
                  <fptr><xsl:attribute name="FILEID">PageContent.<xsl:number level="single" count="link" format="1"/></xsl:attribute></fptr>
              </div>
  </xsl:template>  
    
</xsl:stylesheet>