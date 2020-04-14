<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Symulacje kredytów hipotecznych</title>
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

    <script src="${pageContext.request.contextPath}/js/appmortgage.js"></script>

</head>
<body>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
        src="https://connect.facebook.net/pl_PL/sdk.js#xfbml=1&version=v6.0"></script>

<div class="div-header">
    <%@ include file="/WEB-INF/JSPF/mainheader2.jspf" %>
</div>

<div class="container">
    <h3 class="h3-details">Symulacje ofert kredytu hipotecznego</h3>

    <c:choose>
        <c:when test="${empty mortgageSimulation}">
            <p style="color: #1C3752">Brak ofert dla wybranych parametrów. Spróbouj ponownie.</p>
            <p><a href="${pageContext.request.contextPath}/mortgageParameters" class="btn btn-sm btn-primary rounded">POWRÓT</a>
            </p>
        </c:when>
        <c:otherwise>
            <div class="div-list-offers">
                <table class="table table-hover sticky-header" style="color: #1C3752; text-align: center">
                    <thead class="thead-light">
                    <tr>
                        <th class="th-sticky" style="vertical-align: middle">Bank</th>
                        <th class="th-sticky" style="vertical-align: middle">Oferta</th>
                        <th class="th-sticky" style="vertical-align: middle">Kwota</th>
                        <th class="th-sticky" style="vertical-align: middle">Okres</th>
                        <th class="th-sticky" style="vertical-align: middle">Rata</th>
                        <th class="th-sticky" style="vertical-align: middle; width: 20vmax" id="th-compare">Porównaj (max. 3)</th>
                    </tr>
                    </thead>
                    <c:forEach var="mortgage" items="${mortgageSimulation}">
                        <input type="hidden" value="${userMortgage.cost}" class="input-cost" />
                        <input type="hidden" value="${userMortgage.amount}" class="input-amount" />
                        <input type="hidden" value="${userMortgage.creditPeriod}" class="input-period" />
                        <input type="hidden" value="${userMortgage.contributionPercent}" class="input-percent" />
                        <input type="hidden" value="${userMortgage.age}" class="input-age" />
                        <input type="hidden" value="${userMortgage.chooseServiceCharge}" class="input-charge" />
                        <input type="hidden" value="${userMortgage.chooseInsurance}" class="input-insurance" />
                        <tr>
                            <td style="vertical-align: middle"><img
                                    src="<c:url value="/img/${mortgage.key.bank.logo}" />"
                                    width="70" height="40" alt="${mortgage.key.bank.bankName}"/>
                            </td>
                            <td style="vertical-align: middle">${mortgage.key.offer}</td>
                            <td style="vertical-align: middle"><fmt:formatNumber
                                    type="currency">${userMortgage.amount}</fmt:formatNumber></td>
                            <td style="vertical-align: middle">${userMortgage.creditPeriod} mies.</td>
                            <td style="vertical-align: middle; font-weight: bold; color: crimson"><fmt:formatNumber
                                    type="currency">${mortgage.value}</fmt:formatNumber></td>
                            <td style="vertical-align: middle">
                                <input type="checkbox" name="offer" value="${mortgage.key.id}" class="checkbox1" />
                            </td>
<%--                            <form action="${pageContext.request.contextPath}/mortgageDetails" method="post"--%>
<%--                                  modelAttribute="userMortgage">--%>
<%--                                <input type="hidden" name="mortgageId" value="${mortgage.key.id}">--%>
<%--                                <input type="hidden" name="cost" value="${userMortgage.cost}">--%>
<%--                                <input type="hidden" name="amount" value="${userMortgage.amount}">--%>
<%--                                <input type="hidden" name="creditPeriod" value="${userMortgage.creditPeriod}">--%>
<%--                                <input type="hidden" name="contributionPercent"--%>
<%--                                       value="${userMortgage.contributionPercent}">--%>
<%--                                <input type="hidden" name="age" value="${userMortgage.age}">--%>
<%--                                <input type="hidden" name="chooseServiceCharge"--%>
<%--                                       value="${userMortgage.chooseServiceCharge}">--%>
<%--                                <input type="hidden" name="chooseInsurance" value="${userMortgage.chooseInsurance}">--%>
<%--                                <td><input type="submit" value="Szczegóły"--%>
<%--                                           class="btn btn-sm btn-outline-primary rounded"></td>--%>
<%--                            </form>--%>
<%--                            <td>--%>
<%--                                <a href="${pageContext.request.contextPath}/listOfAgencies?bankId=${mortgage.key.bank.id}&amount=${userMortgage.amount}&creditPeriod=${userMortgage.creditPeriod}"--%>
<%--                                   class="btn btn-sm btn-outline-primary rounded">Lista oddziałów</a></td>--%>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:otherwise>
    </c:choose>

    <div class="info-alert">
        <p>Przedstawione symulacje mają charakter informacyjny oraz nie stanowią oferty handlowej w rozumieniu Art.
            66. par. 1 Kodeksu Cywilnego. Dane wykorzystane do przygotowania symulacji pochodzą bezpośrednio z
            poszczególnych banków, jednak finalna wersja oferty może się różnić od przedstawionej w serwisie
            Wybankuj.pl. Otrzymanie kredytu uzależnione jest od wielu czynników, do których należą posiadanie
            zdolności kredytowej, akceptowanego źródła dochodu, dobrej historii kredytowej, a dodatkowym warunkiem
            jest pozytywna ocena scoringowa wydana przez system bankowy.</p>
    </div>
</div>

<div class="div-footer">
    <%@ include file="/WEB-INF/JSPF/footer.jspf" %>
</div>
</body>
</html>
