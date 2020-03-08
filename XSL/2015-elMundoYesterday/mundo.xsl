<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/periodico">
    <html>
      <head>
        <title>El Mundo Yesterday</title>
       <!--
       <style>
          thead td {
          color: #FFFFFF;
          }
          table img {
          width: 50px;
          }
        </style>
       -->
        
        <xsl:call-template name="css"/>
      </head>
      <body>
        <div style="width: 200px; background:#dbb13b; position: left;">
          <table>
            <tbody>
              <tr class="menu">
                <td>
                  <xsl:value-of select="@enlace"/>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template name="css">
    body {
    font-family: Arial;
    font-size: 12px;
    }

    ol, ul
    {
    margin-top: 10px;
    margin-left: 0px;
    }

    #menu li
    {
    margin-left: 0px;
    display: inline;
    list-style-type: none;
    padding: 10px 50px;
    }

    .noticia {
    /* border: #000 solid 1px; */
    padding: 10px 5px;
    float: left;
    width: 338px;
    }

    .noticia img {
    width: 338px;
    }

    .noticiaDobleAncho {
    /* border: #000 solid 1px; */
    padding: 10px 5px;
    float: left;
    width: 690px;
    }

    .noticiaDobleAncho img {
    width: 690px;
    }

    .fechaNoticia {
    color: #A3A34B;
    }

    .comentariosNoticia {
    color: #A3A34B;
    padding-left: 20px;
    }

    .divPublicidad {
    /* border: #000 solid 1px; */
    padding: 10px 5px;
    float: right;
    width: 280px;                    }
    }

    .divPublicidad img {
    width: 200px;
    }

  </xsl:template>

   <xsl:template name="banner">
    <tr>
      <td>
        <img src="{.}"/>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>


                
