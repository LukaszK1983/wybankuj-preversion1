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
    <h3 class="h3-details"><img src="<c:url value="/img/${bank.logo}" />" alt="${bank.bankName}" class="img-h3"/>
        <span class="span-h3">Lista oddziałów</span></h3>

    <div class="float-right">
        <form action="${pageContext.request.contextPath}/listOfAgenciesMortgage" method="post">
            <input type="hidden" name="bankId" value="${bank.id}"/>
            <input type="hidden" name="cost" value="${userMortgage.cost}"/>
            <input type="hidden" name="amount" value="${userMortgage.amount}"/>
            <input type="hidden" name="creditPeriod" value="${userMortgage.creditPeriod}"/>
            <input type="hidden" name="contributionPercent" value="${userMortgage.contributionPercent}"/>
            <input type="hidden" name="offer" value="${offer}"/>
            <input type="hidden" name="age" value="${userMortgage.age}"/>
            <input type="hidden" name="chooseServiceCharge" value="${userMortgage.chooseServiceCharge}"/>
            <input type="hidden" name="chooseInsurance" value="${userMortgage.chooseInsurance}"/>
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
                <form action="${pageContext.request.contextPath}/mortgageParameters" method="post"
                      modelattribute="userMortgage">
                    <input type="hidden" name="cost" value="${userMortgage.cost}"/>
                    <input type="hidden" name="amount" value="${userMortgage.amount}"/>
                    <input type="hidden" name="creditPeriod" value="${userMortgage.creditPeriod}"/>
                    <input type="hidden" name="contributionPercent" value="${userMortgage.contributionPercent}"/>
                    <input type="hidden" name="age" value="${userMortgage.age}"/>
                    <input type="hidden" name="chooseServiceCharge" value="${userMortgage.chooseServiceCharge}"/>
                    <input type="hidden" name="chooseInsurance" value="${userMortgage.chooseInsurance}"/>
                    <p style="color: #1C3752"><input type="submit" value="Powrót do listy ofert" class="btn btn-sm btn-primary rounded"/></p>
                </form>
            </div>
        </c:when>
        <c:otherwise>

            <div>
                <table class="table div-list-offers">
                    <thead>
                    <tr>
                        <th class="th-sticky-agencies">Nazwa</th>
                        <th class="th-sticky-agencies">Ulica</th>
                        <th class="th-sticky-agencies">Miasto</th>
                        <th class="th-sticky-agencies">Telefon</th>
                        <th class="th-sticky-agencies">E-mail</th>
                        <th class="th-sticky-agencies">Otwarte</th>
                        <th class="th-sticky-agencies"></th>
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
                                <a href="${pageContext.request.contextPath}/agencyContactFormMortgage?agencyId=${agency.id}&cost=${userMortgage.cost}&amount=${userMortgage.amount}&creditPeriod=${userMortgage.creditPeriod}&contributionPercent=${userMortgage.contributionPercent}&offer=${offer}
&age=${userMortgage.age}&chooseServiceCharge=${userMortgage.chooseServiceCharge}&chooseInsurance=${userMortgage.chooseInsurance}"
                                   class="btn btn-sm btn-outline-info rounded">Formularz kontaktowy</a></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <form action="${pageContext.request.contextPath}/mortgageParameters" method="post"
                              modelattribute="userMortgage">
                            <input type="hidden" name="bankId" value="${bank.id}"/>
                            <input type="hidden" name="cost" value="${userMortgage.cost}"/>
                            <input type="hidden" name="amount" value="${userMortgage.amount}"/>
                            <input type="hidden" name="creditPeriod" value="${userMortgage.creditPeriod}"/>
                            <input type="hidden" name="contributionPercent" value="${userMortgage.contributionPercent}"/>
                            <input type="hidden" name="offer" value="${offer}"/>
                            <input type="hidden" name="age" value="${userMortgage.age}"/>
                            <input type="hidden" name="chooseServiceCharge" value="${userMortgage.chooseServiceCharge}"/>
                            <input type="hidden" name="chooseInsurance" value="${userMortgage.chooseInsurance}"/>
                            <input type="submit" value="Powrót do listy ofert" class="btn btn-sm btn-primary rounded"/>
                        </form>
                    </tr>
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
