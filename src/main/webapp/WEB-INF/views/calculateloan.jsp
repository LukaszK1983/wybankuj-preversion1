<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Symulacje kredytów gotówkowych</title>
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
    <h3 class="h3-details">Symulacje ofert kredytu gotówkowego</h3>

    <c:choose>
        <c:when test="${empty loanSimulation}">
            <p style="color: #1C3752">Brak ofert dla wybranych parametrów. Spróbouj ponownie.</p>
            <p><a href="${pageContext.request.contextPath}/loanParameters"
                  class="btn btn-sm btn-primary rounded">POWRÓT</a></p>
        </c:when>
        <c:otherwise>
            <div class="div-list-offers">
                <table class="table" style="color: #1C3752; text-align: center">
                    <thead class="thead-light">
                    <tr>
                        <th>Bank</th>
                        <th>Oferta</th>
                        <th>Kwota</th>
                        <th>Okres</th>
                        <th>Rata</th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <c:forEach var="loan" items="${loanSimulation}">
                        <tr>
                            <td style="vertical-align: middle"><img src="<c:url value="/img/${loan.key.bank.logo}" />" width="70" height="40"
                                     alt="${loan.key.bank.bankName}"/></td>
                            <td style="vertical-align: middle">${loan.key.offer}</td>
                            <td style="vertical-align: middle"><fmt:formatNumber type="currency" >${userLoan.amount}</fmt:formatNumber></td>
                            <td style="vertical-align: middle">${userLoan.creditPeriod} mies.</td>
                            <td style="vertical-align: middle; font-weight: bold; color: crimson"><fmt:formatNumber type="currency" >${loan.value}</fmt:formatNumber></td>
                            <form action="${pageContext.request.contextPath}/loanDetails" method="post"
                                  modelAttribute="userLoan">
                                <input type="hidden" name="loanId" value="${loan.key.id}">
                                <input type="hidden" name="amount" value="${userLoan.amount}">
                                <input type="hidden" name="creditPeriod" value="${userLoan.creditPeriod}">
                                <input type="hidden" name="age" value="${userLoan.age}">
                                <input type="hidden" name="chooseServiceCharge" value="${userLoan.chooseServiceCharge}">
                                <input type="hidden" name="chooseInsurance" value="${userLoan.chooseInsurance}">
                                <td style="vertical-align: middle"><input type="submit" value="Szczegóły"
                                           class="btn btn-sm btn-outline-primary rounded"></td>
                            </form>
                            <td style="vertical-align: middle">
                                <a href="${pageContext.request.contextPath}/listOfAgencies?bankId=${loan.key.bank.id}&amount=${userLoan.amount}&creditPeriod=${userLoan.creditPeriod}"
                                   class="btn btn-sm btn-outline-primary rounded">Lista oddziałów</a></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </c:otherwise>
    </c:choose>

    <div class="info-alert">
        <p>Przedstawione symulacje mają charakter informacyjny oraz nie stanowią oferty handlowej w rozumieniu Art. 66. par. 1 Kodeksu Cywilnego. Dane wykorzystane do przygotowania symulacji pochodzą bezpośrednio z poszczególnych banków, jednak finalna wersja oferty może się różnić od przedstawionej w serwisie Wybankuj.pl. Otrzymanie kredytu uzależnione jest od wielu czynników, do których należą posiadanie zdolności kredytowej, akceptowanego źródła dochodu, dobrej historii kredytowej, a dodatkowym warunkiem jest pozytywna ocena scoringowa wydana przez system bankowy.</p>
    </div>
</div>

<div class="div-footer">
    <%@ include file="/WEB-INF/JSPF/footer.jspf" %>
</div>
</body>
</html>
