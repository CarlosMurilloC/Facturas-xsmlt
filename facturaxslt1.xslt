<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">  
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Factura TechZone</title>
                <style>
                    body {
                        font-family: 'Arial', sans-serif;
                        background-color: #f4f4f4;
                        color: #333;
                        padding: 20px;
                    }
                    .container {
                        max-width: 800px;
                        margin: auto;
                        background: white;
                        padding: 20px;
                        border-radius: 8px;
                        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
                    }
                    h2 {
                        text-align: center;
                        color: #007bff;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 20px;
                    }
                    th, td {
                        border: 1px solid #ddd;
                        padding: 10px;
                        text-align: left;
                    }
                    th {
                        background: #007bff;
                        color: white;
                    }
                    td {
                        background: #f9f9f9;
                    }
                    .total {
                        font-weight: bold;
                        color: #007bff;
                    }
                    .logo {
                        display: block;
                        margin: auto;
                        width: 150px;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <img src="logo_1.png" alt="Logo TechZone" class="logo"/>
                    <h2>Factura Electrónica</h2>
                    <table>
                        <tr>
                            <th>Fecha</th>
                            <td><xsl:value-of select="//InvoiceIssueDate"/></td>
                        </tr>
                        <tr>
                            <th>Vendedor</th>
                            <td><xsl:value-of select="//SellerParty/PartyName/Name"/></td>
                        </tr>
                        <tr>
                            <th>CIF/NIF Vendedor</th>
                            <td><xsl:value-of select="//SellerParty/TaxIdentification/TaxIdentificationNumber"/></td>
                        </tr>
                        <tr>
                            <th>Cliente</th>
                            <td><xsl:value-of select="//BuyerParty/PartyName/Name"/></td>
                        </tr>
                        <tr>
                            <th>CIF/NIF Cliente</th>
                            <td><xsl:value-of select="//BuyerParty/TaxIdentification/TaxIdentificationNumber"/></td>
                        </tr>
                        <tr>
                            <th>Total</th>
                            <td class="total"><xsl:value-of select="//InvoiceTotalAmount"/> €</td>
                        </tr>
                        <tr>
                            <th>Moneda</th>
                            <td><xsl:value-of select="//InvoiceCurrencyCode"/></td>
                        </tr>
                    </table>
                    <h3>Detalle de Productos</h3>
                    <table>
                        <tr>
                            <th>Descripción</th>
                            <th>Cantidad</th>
                            <th>Precio Unitario</th>
                            <th>Total</th>
                        </tr>
                        <xsl:for-each select="//Items/InvoiceLine">
                            <tr>
                                <td><xsl:value-of select="ItemDescription"/></td>
                                <td><xsl:value-of select="Quantity"/></td>
                                <td><xsl:value-of select="UnitPriceWithoutTax"/> €</td>
                                <td><xsl:value-of select="TotalCost"/> €</td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
