<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Szczegóły oferty kredytu hipotecznego</title>
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
    <h3 class="h3-details">Szczegóły oferty ${mortgage.offer}</h3>

    <div class="div-list-offers">
        <table class="table" style="color: #1C3752;">
            <tr>
                <td style="vertical-align: middle; background-color: #F0F5FA">Bank:</td>
                <td><img src="<c:url value="/img/${mortgage.bank.logo}" />" width="70vmax" height="40vmax"
                         alt="${mortgage.bank.bankName}"/></td>
            </tr>
            <tr>
                <td style="background-color: #F0F5FA">Oferta:</td>
                <td style="font-weight: bold; color: crimson">${mortgage.offer}</td>
            </tr>
            <tr>
                <td style="background-color: #F0F5FA">Koszt inwestycji:</td>
                <td style="font-weight: bold; color: crimson"><fmt:formatNumber type="currency" >${userMortgage.cost}</fmt:formatNumber></td>
            </tr>
            <tr>
                <td style="background-color: #F0F5FA">Kwota kredytu:</td>
                <td style="font-weight: bold; color: crimson"><fmt:formatNumber type="currency" >${userMortgage.amount}</fmt:formatNumber></td>
            </tr>
            <tr>
                <td style="background-color: #F0F5FA">Okres kredytowania:</td>
                <td style="font-weight: bold; color: crimson">${userMortgage.creditPeriod} mies.</td>
            </tr>
            <tr>
                <td style="background-color: #F0F5FA">Wkład własny:</td>
                <td style="font-weight: bold; color: crimson">${userMortgage.contributionPercent}%, czyli <fmt:formatNumber type="currency" >${userMortgage.cost - userMortgage.amount}</fmt:formatNumber></td>
            </tr>
            <tr>
                <td style="background-color: #F0F5FA">Wysokość raty:</td>
                <td style="font-weight: bold; color: crimson"><fmt:formatNumber type="currency" >${payment}</fmt:formatNumber></td>
            </tr>
            <tr>
                <td style="background-color: #F0F5FA">Oprocentowanie nominalne:</td>
                <td style="font-weight: bold; color: crimson">${mortgage.creditRate}%</td>
            </tr>
            <tr>
                <td style="background-color: #F0F5FA">Prowizja za uruchomienie:</td>
                <td style="font-weight: bold; color: crimson">${mortgage.serviceCharge}%, czyli <fmt:formatNumber type="currency" >${serviceCharge}</fmt:formatNumber></td>
            </tr>
            <tr>
                <td style="background-color: #F0F5FA">Ubezpieczenie:</td>
                <td style="font-weight: bold; color: crimson">${mortgage.insurance}%, czyli <fmt:formatNumber type="currency" >${insurance}</fmt:formatNumber></td>
            </tr>
            <tr>
                <td style="background-color: #F0F5FA">Odsetki:</td>
                <td style="font-weight: bold; color: crimson"><fmt:formatNumber type="currency" >${interests}</fmt:formatNumber></td>
            </tr>
            <tr>
                <td style="background-color: #F0F5FA">Koszt całkowity:</td>
                <td style="font-weight: bold; color: crimson"><fmt:formatNumber type="currency" >${totalCost}</fmt:formatNumber></td>
            </tr>
            <tr>
                <td class="btn-next">
                    <form action="${pageContext.request.contextPath}/mortgageParameters" method="post"
                          modelattribute="userMortgage">
                        <input type="hidden" name="amount" value="${userMortgage.amount}"/>
                        <input type="hidden" name="creditPeriod" value="${userMortgage.creditPeriod}"/>
                        <input type="hidden" name="contributionPercent" value="${userMortgage.contributionPercent}"/>
                        <input type="hidden" name="age" value="${userMortgage.age}"/>
                        <input type="hidden" name="chooseServiceCharge" value="${userMortgage.chooseServiceCharge}"/>
                        <input type="hidden" name="chooseInsurance" value="${userMortgage.chooseInsurance}"/>
                        <p><input type="submit" value="Powrót" class="btn btn-sm btn-primary rounded"/></p>
                    </form>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/listOfAgencies?bankId=${mortgage.bank.id}&amount=${userMortgage.amount}&creditPeriod=${userMortgage.creditPeriod}"
                       class="btn btn-sm btn-outline-success rounded">Wybierz oddział do kontaktu</a></td>
            </tr>
        </table>
    </div>

    <div class="info-alert">
        <p>Przedstawione symulacje mają charakter informacyjny oraz nie stanowią oferty handlowej w rozumieniu Art. 66.
            par. 1 Kodeksu Cywilnego. Dane wykorzystane do przygotowania symulacji pochodzą bezpośrednio z
            poszczególnych banków, jednak finalna wersja oferty może się różnić od przedstawionej w serwisie
            Wybankuj.pl. Otrzymanie kredytu uzależnione jest od wielu czynników, do których należą posiadanie zdolności
            kredytowej, akceptowanego źródła dochodu, dobrej historii kredytowej, a dodatkowym warunkiem jest pozytywna
            ocena scoringowa wydana przez system bankowy.</p>
    </div>
</div>

<div class="div-footer">
    <%@ include file="/WEB-INF/JSPF/footer.jspf" %>
</div>
</body>
</html>
