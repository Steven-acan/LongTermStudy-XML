
<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    File: example.xsl
    Description: Formal template for an XSLT stylesheet
    Author: [Your Name]
    Created: YYYY-MM-DD
-->

<xsl:stylesheet 
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- ========================================= -->
    <!-- Output settings                             -->
    <!-- ========================================= -->
    <xsl:output 
        method="xml" 
        version="1.0" 
        encoding="UTF-8" 
        indent="yes"/>

    <!-- ========================================= -->
    <!-- Global parameters (optional)                -->
    <!-- ========================================= -->
    <xsl:param name="pExample" select="'DefaultValue'"/>

    <!-- ========================================= -->
    <!-- Keys (optional)                             -->
    <!-- ========================================= -->
    <!-- <xsl:key name="kItemById" match="Item" use="@id"/> -->

    <!-- ========================================= -->
    <!-- Template: Root match                        -->
    <!-- ========================================= -->
    <xsl:template match="/">

        <!-- Start output document root -->
        <TransformedDocument>
            <xsl:apply-templates select="RootElement"/>
        </TransformedDocument>

    </xsl:template>

    <!-- ========================================= -->
    <!-- Template: RootElement                       -->
    <!-- ========================================= -->
    <xsl:template match="RootElement">

        <HeaderCopy>
            <xsl:copy-of select="Header"/>
        </HeaderCopy>

        <Items>
            <xsl:apply-templates select="Body/Item"/>
        </Items>

    </xsl:template>

    <!-- ========================================= -->
    <!-- Template: Item transformation               -->
    <!-- ========================================= -->
    <xsl:template match="Item">

        <MappedItem>
            <ID><xsl:value-of select="ItemID"/></ID>
            <Description><xsl:value-of select="Description"/></Description>
            <Quantity unit="{Quantity/@unit}">
                <xsl:value-of select="Quantity"/>
            </Quantity>
        </MappedItem>

    </xsl:template>

    <!-- ========================================= -->
    <!-- Template: default copy behavior (optional)  -->
    <!-- ========================================= -->
    <!--
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>
    -->

</xsl:stylesheet>
