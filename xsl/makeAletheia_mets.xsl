<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns="http://www.loc.gov/METS/"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:param name="imagefolder"/>
    <xsl:param name="pagefolder"/>
    <xsl:param name="imageFormat"/>
    <xsl:param name="noIMAGE"/>
    <xsl:param name="noPAGE"/>
    <xsl:param name="drive"/>
    
    
    
   <xsl:template match="gt"> 
    <mets xmlns="http://www.loc.gov/METS/" 
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
        xmlns:xlink="http://www.w3.org/1999/xlink" 
        xsi:schemaLocation="http://www.loc.gov/METS/ http://www.loc.gov/standards/mets/version18/mets.xsd">
        <metsHdr CREATEDATE="2019-02-20T10:10:14" LASTMODDATE="2019-02-20T10:10:14"/>
        <fileSec>
            <xsl:choose>
                <xsl:when test="$noPAGE = 'yes'">
                    <fileGrp USE="PageContent"/>
                </xsl:when>
                <xsl:otherwise>
                    <fileGrp USE="PageContent">
                        <xsl:apply-templates mode="Link1"/>
                    </fileGrp>
                </xsl:otherwise>
            </xsl:choose>
            
            
            <fileGrp USE="Binary"/>
           
            <xsl:choose>
                <xsl:when test="$noIMAGE = 'yes'">
                    <fileGrp USE="Master"/>
                </xsl:when>
                <xsl:otherwise>
                    <fileGrp USE="Master">
                        <xsl:apply-templates mode="Link2" />
                    </fileGrp>
                    <fileGrp USE="MAX">
                        <xsl:apply-templates mode="Link4" />
                    </fileGrp>
                </xsl:otherwise>
            </xsl:choose>
            
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
                <xsl:variable name="path"><xsl:apply-templates/></xsl:variable>
                <xsl:message select="$path"></xsl:message>
                <xsl:attribute name="xlink:href"><xsl:value-of select="replace(replace($path, $imagefolder, $pagefolder), '/home/dta', $drive) "/>.xml</xsl:attribute>
                
            </FLocat>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="link" mode="Link2">
        <file>
            <xsl:attribute name="ID">Master.<xsl:number level="single" count="link" format="1"/></xsl:attribute>
            <FLocat xlink:type="simple" LOCTYPE="URL">
                <xsl:variable name="path"><xsl:value-of select="replace(., '/home/dta', $drive)"/></xsl:variable>
                <xsl:attribute name="xlink:href"><xsl:value-of select="$path"/>.<xsl:value-of select="$imageFormat"/></xsl:attribute>
            </FLocat>
        </file>
    </xsl:template>


      <xsl:template match="link" mode="Link3">
              <div>
                  <xsl:attribute name="ID">physical.<xsl:number level="single" count="link" format="1"/></xsl:attribute>
                  <xsl:attribute name="TYPE">page</xsl:attribute>
                  <xsl:attribute name="ORDER"><xsl:number level="single" count="link" format="1"/></xsl:attribute>
                  <xsl:choose>
                      <xsl:when test="$noIMAGE = 'yes'"/>
                      <xsl:otherwise><fptr><xsl:attribute name="FILEID">Master.<xsl:number level="single" count="link" format="1"/></xsl:attribute></fptr></xsl:otherwise>
                  </xsl:choose>
                  <xsl:choose>
                      <xsl:when test="$noPAGE = 'yes'"/>
                      <xsl:otherwise><fptr><xsl:attribute name="FILEID">PageContent.<xsl:number level="single" count="link" format="1"/></xsl:attribute></fptr></xsl:otherwise>
                  </xsl:choose>
              </div>
  </xsl:template>  

    <xsl:template match="link" mode="Link4">
        <file>
            <xsl:attribute name="ID">MAX.<xsl:number level="single" count="link" format="1"/></xsl:attribute>
            <xsl:attribute name="MIMETYPE">image/<xsl:value-of select="$imageFormat"/></xsl:attribute>
            <FLocat xlink:type="simple" LOCTYPE="URL">
                <xsl:attribute name="xlink:href"><xsl:apply-templates/>.<xsl:value-of select="$imageFormat"/></xsl:attribute>
            </FLocat>
        </file>
    </xsl:template>
    
</xsl:stylesheet>
