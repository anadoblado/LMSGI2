<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="utf-8"/>
  <xsl:template match="partidoBaloncesto">
    <html>
      <head>
        <title>PARTIDO DE BALONCESTO</title>
        <style>
          thead td {
          background: #d8e7ff;
          color: #FFFFFF;
          <!--bgcolor="#d8e7ff"-->
          }
          
          table img {
          width: 50px;
          }
          body{
          margin: 50px;
          padding: 0px;
          }
        </style>
      </head>
      <body>
        <h1 align="center">Baloncesto: Baloncesto Lucena - Unicaja Baloncesto</h1>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>