<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" encoding="UTF-8" omit-xml-declaration="yes" indent="yes" />
    <xsl:template match="/">
        <html>
            <head>
                <title>Progetto di Codifica di Testi - E. Artom</title>
                <link rel="stylesheet"
                    href="https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css" />
                <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
                <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
                <script src="script.js"></script>
                <link href="stile.css" rel="stylesheet" type="text/css" />
            </head>
            <body>
                <header>
                    <h1>
                        <xsl:value-of select="//tei:title[@xml:lang='it']" />
                    </h1>
                </header>

                <nav class="navMenu">
                    <ul>
                        <li>
                            <a href="#info">Informazioni</a>
                        </li>
                        <li>
                            <a href="#p110">Pagina 110</a>
                        </li>
                        <li>
                            <a href="#p156">Pagina 156</a>
                        </li>
                        <li>
                            <a href="#p157">Pagina 157</a>
                        </li>
                        <li>
                            <a href="#about">Riferimenti</a>
                        </li>
                    </ul>
                </nav>
                <div>
                    <div id="info">
                        <article>
                            <div>
                                <h2>Informazioni</h2>
                                <xsl:value-of select="//tei:origin" />

                                <xsl:value-of select="//tei:acquisition" />

                                <h2>Descrizione</h2>

                                <xsl:apply-templates select="//tei:physDesc" />

                                <xsl:apply-templates select="//tei:setting"></xsl:apply-templates>
                            </div>
                        </article>

                        <div id="fenomeni">

                            <div id="bottoni">
                                <h3>Visualizza fenomeni notevoli</h3>
                                <button id="btn-add">Aggiunte</button>
                                <button id="btn-del">Cancellazioni</button>
                                <button id="btn-gap">Gap</button>
                                <button id="btn-persname">Persone</button>
                                <button id="btn-hide">Nascondi tutto</button>
                            </div>
                        </div>


                    </div>
                </div>
                <article id="p110">
                    <h2> Pagina 110 </h2>
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='Pag110']" />
                        </div>
                        <div class="text">
                            <xsl:apply-templates select="//tei:body/tei:div[@n = '110']" />
                        </div>

                    </div>

                </article>

                <article id="p156">
                    <h2> Pagina 156 </h2>
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='Pag156']" />
                        </div>
                        <div class="text">
                            <xsl:apply-templates select="//tei:body/tei:div[@n = '156']" />
                        </div>

                    </div>

                </article>

                <article id="p157">
                    <h2> Pagina 157 </h2>
                    <div class="flexbox">
                        <div class="img">
                            <xsl:apply-templates select="//tei:surface[@xml:id='Pag157']" />
                        </div>
                        <div class="text">
                            <xsl:apply-templates select="//tei:body/tei:div[@n = '157']" />
                        </div>

                    </div>

                </article>

                <div class="listaBibl">
                    <h2>Riferimenti bibliografici</h2>
                    <xsl:apply-templates select="//tei:bibl" />                    
                </div>

                <div class="listaLuoghi">
                    <h2>Luoghi</h2>
                    <xsl:apply-templates select="//tei:place" />                    
                </div>

                <footer>
                    <h3 id="about">About</h3>
                    <xsl:apply-templates select="//tei:editionStmt" />
                </footer>
            </body>
        </html>
    </xsl:template>


    <xsl:template match="tei:editionStmt">
        <p>
            <xsl:value-of select="current()/tei:edition"></xsl:value-of>
        </p>
        <p> Realizzato da: <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='LP']"></xsl:value-of>
        </p>
        <p>Preofessore: <xsl:value-of select="current()/tei:respStmt/tei:name[@xml:id='AMDG']"></xsl:value-of>
        </p>
    </xsl:template>

    <xsl:template match="tei:lb[not(@break)]">
        <br />
        <xsl:element name="span">
            <b>
                <xsl:value-of select="@n" />
            </b>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:gap">
        <gap>?</gap>
    </xsl:template>

    <xsl:template match="tei:del">
        <del>
            <xsl:apply-templates />
        </del>
    </xsl:template>


    <xsl:template match="tei:add">
        <add>
            <xsl:apply-templates />
        </add>
    </xsl:template>


    <xsl:template match="tei:pb">
        <xsl:element name="div">
            <xsl:attribute name="id">pag_<xsl:value-of select="current()/@n" />
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:persName">
        <persname>
            <xsl:apply-templates />
        </persname>
    </xsl:template>


    <xsl:template match="tei:surface">
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="concat(@xml:id, '.jpeg')" />
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    
    <xsl:template match="tei:bibl">
        <li>
            <xsl:value-of select="current()/tei:author/tei:forename" />
            <xsl:value-of select="current()/tei:author/tei:surname" />,
            <i>
                <xsl:value-of select="current()/tei:title" />,
            </i>
            <xsl:value-of select="current()/tei:pubPlace/tei:placeName" />,
            <xsl:value-of select="current()/tei:publisher" />,
            <xsl:value-of select="current()/tei:date" />
        </li>
    </xsl:template>

    <xsl:template match="tei:place">
        <li>
            <i>
                <xsl:value-of select="current()/tei:placeName" />,
            </i>
            <xsl:value-of select="current()/tei:settlement" />,
            <xsl:value-of select="current()/tei:country" />
        </li>
    </xsl:template>

</xsl:stylesheet>