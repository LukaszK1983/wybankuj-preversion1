<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Oddziały</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
</head>
<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
        src="https://connect.facebook.net/pl_PL/sdk.js#xfbml=1&version=v6.0"></script>

<div class="div-header">
    <%@ include file="/WEB-INF/JSPF/mainheader2.jspf" %>
</div>

<div class="container">
    <h3 class="h3-details"><span class="span-h3">Lista oddziałów</span>
        <img src="<c:url value="/img/${bank.logo}" />" alt="${bank.bankName}" class="img-h3" /></h3>

    <div class="float-right">
        <form action="${pageContext.request.contextPath}/listOfAgencies" method="post">
            <input type="hidden" name="bankId" value="${bank.id}"/>
            <input type="hidden" name="amount" value="${amount}"/>
            <input type="hidden" name="creditPeriod" value="${creditPeriod}"/>
            <p style="color: #1C3752">Wyszukaj wg miasta:
                <label><input type="text" name="city"/></label>
                <label><input type="submit" value="SZUKAJ" class="btn btn-sm btn-primary rounded"/></label></p>
        </form>
    </div>
    <c:choose>
        <c:when test="${empty agencies}">
            <div>
                <p style="color: #1C3752">Brak oddziału banku w wybranym mieście. Wyszukaj inną
                    lokalizację.</p>
            </div>
        </c:when>
        <c:otherwise>

            <div>
                <table class="table div-list-offers">
                    <thead style="background-color: #1C3752; color: #FFFFFF">
                    <tr>
                        <th>Nazwa</th>
                        <th>Ulica</th>
                        <th>Miasto</th>
                        <th>Telefon</th>
                        <th>E-mail</th>
                        <th>Otwarte</th>
                        <th></th>
                    </tr>
                    </thead>
                    <c:forEach var="agency" items="${agencies}">
                        <tr style="font-size: 12px; color: #1C3752">
                            <td style="vertical-align: middle">${agency.agencyName}</td>
                            <td style="vertical-align: middle">${agency.street} ${agency.streetNumber}</td>
                            <td style="vertical-align: middle">${agency.zipCode} ${agency.city}</td>
                            <td style="vertical-align: middle">${agency.phone}</td>
                            <td style="vertical-align: middle">${agency.email}</td>
                            <td style="vertical-align: middle">${agency.hours}</td>
                            <td style="vertical-align: middle">
                                <a href="${pageContext.request.contextPath}/agencyContactForm?agencyId=${agency.id}&amount=${amount}&creditPeriod=${creditPeriod}"
                                   class="btn btn-sm btn-outline-info rounded">Formularz kontaktowy</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<div class="div-footer">
    <%@ include file="/WEB-INF/JSPF/footer.jspf" %>
</div>
</body>
</html>
