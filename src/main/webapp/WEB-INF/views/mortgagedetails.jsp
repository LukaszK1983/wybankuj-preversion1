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
    <h3 class="h3-details">Porównanie ofert</h3>

    <div class="div-list-offers">
        <table class="table" style="color: #1C3752; text-align: center">
            <thead>
            <th></th>
            <th class="th-sticky-compare"><img src="<c:url value="/img/${calculations1.mortgage.bank.logo}" />" width="70vmax" height="40vmax"
                                               alt="${calculations1.mortgage.bank.bankName}" /></th>
            <c:choose>
                <c:when test="${testMortgage2}">
                    <th class="th-sticky-compare"><img src="<c:url value="/img/${calculations2.mortgage.bank.logo}" />" width="70vmax" height="40vmax"
                                                       alt="${calculations2.mortgage.bank.bankName}" /></th>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${testMortgage3}">
                    <th class="th-sticky-compare"><img src="<c:url value="/img/${calculations3.mortgage.bank.logo}" />" width="70vmax" height="40vmax"
                                                       alt="${calculations3.mortgage.bank.bankName}" /></th>
                </c:when>
            </c:choose>
            </thead>
            <tr>
                <td class="td-compare-offers">Oferta:</td>
                <td class="td-compare-offers-normal">${calculations1.mortgage.offer}</td>
                <c:choose>
                    <c:when test="${testMortgage2}">
                        <td class="td-compare-offers-normal">${calculations2.mortgage.offer}</td>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${testMortgage3}">
                        <td class="td-compare-offers-normal">${calculations3.mortgage.offer}</td>
                    </c:when>
                </c:choose>
            </tr>
            <tr>
                <td class="td-compare-offers">Koszt inwestycji:</td>
                <td class="td-compare-offers-normal"><fmt:formatNumber type="currency" >${userMortgage.cost}</fmt:formatNumber></td>
                <c:choose>
                    <c:when test="${testMortgage2}">
                        <td class="td-compare-offers-normal"><fmt:formatNumber type="currency" >${userMortgage.cost}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${testMortgage3}">
                        <td class="td-compare-offers-normal"><fmt:formatNumber type="currency" >${userMortgage.cost}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
            </tr>
            <tr>
                <td class="td-compare-offers">Kwota kredytu:</td>
                <td class="td-compare-offers-normal-bold"><fmt:formatNumber type="currency" >${userMortgage.amount}</fmt:formatNumber></td>
                <c:choose>
                    <c:when test="${testMortgage2}">
                        <td class="td-compare-offers-normal-bold"><fmt:formatNumber type="currency" >${userMortgage.amount}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${testMortgage3}">
                        <td class="td-compare-offers-normal-bold"><fmt:formatNumber type="currency" >${userMortgage.amount}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
            </tr>
            <tr>
                <td class="td-compare-offers">Okres kredytowania:</td>
                <td class="td-compare-offers-normal">${userMortgage.creditPeriod} mies.</td>
                <c:choose>
                    <c:when test="${testMortgage2}">
                        <td class="td-compare-offers-normal">${userMortgage.creditPeriod} mies.</td>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${testMortgage3}">
                        <td class="td-compare-offers-normal">${userMortgage.creditPeriod} mies.</td>
                    </c:when>
                </c:choose>
            </tr>
            <tr>
                <td class="td-compare-offers">Wkład własny:</td>
                <td class="td-compare-offers-normal">${userMortgage.contributionPercent}%, czyli <fmt:formatNumber type="currency" >${userMortgage.cost - userMortgage.amount}</fmt:formatNumber></td>
                <c:choose>
                    <c:when test="${testMortgage2}">
                        <td class="td-compare-offers-normal">${userMortgage.contributionPercent}%, czyli <fmt:formatNumber type="currency" >${userMortgage.cost - userMortgage.amount}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${testMortgage3}">
                        <td class="td-compare-offers-normal">${userMortgage.contributionPercent}%, czyli <fmt:formatNumber type="currency" >${userMortgage.cost - userMortgage.amount}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
            </tr>
            <tr>
                <td class="td-compare-offers">Wysokość raty:</td>
                <td class="td-compare-offers-red-bold"><fmt:formatNumber type="currency" >${calculations1.payment}</fmt:formatNumber></td>
                <c:choose>
                    <c:when test="${testMortgage2}">
                        <td class="td-compare-offers-red-bold"><fmt:formatNumber type="currency" >${calculations2.payment}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${testMortgage3}">
                        <td class="td-compare-offers-red-bold"><fmt:formatNumber type="currency" >${calculations3.payment}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
            </tr>
            <tr>
                <td class="td-compare-offers">Oprocentowanie nominalne:</td>
                <td class="td-compare-offers-normal">${calculations1.mortgage.creditRate}%</td>
                <c:choose>
                    <c:when test="${testMortgage2}">
                        <td class="td-compare-offers-normal">${calculations2.mortgage.creditRate}%</td>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${testMortgage3}">
                        <td class="td-compare-offers-normal">${calculations3.mortgage.creditRate}%</td>
                    </c:when>
                </c:choose>
            </tr>
            <tr>
                <td class="td-compare-offers">Prowizja za uruchomienie:</td>
                <td class="td-compare-offers-red">${calculations1.mortgage.serviceCharge}%, czyli <fmt:formatNumber type="currency" >${calculations1.serviceCharge}</fmt:formatNumber></td>
                <c:choose>
                    <c:when test="${testMortgage2}">
                        <td class="td-compare-offers-red">${calculations2.mortgage.serviceCharge}%, czyli <fmt:formatNumber type="currency" >${calculations2.serviceCharge}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${testMortgage3}">
                        <td class="td-compare-offers-red">${calculations3.mortgage.serviceCharge}%, czyli <fmt:formatNumber type="currency" >${calculations3.serviceCharge}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
            </tr>
            <tr>
                <td class="td-compare-offers">Ubezpieczenie:</td>
                <td class="td-compare-offers-red">${calculations1.mortgage.insurance}%, czyli <fmt:formatNumber type="currency" >${calculations1.insurance}</fmt:formatNumber></td>
                <c:choose>
                    <c:when test="${testMortgage2}">
                        <td class="td-compare-offers-red">${calculations2.mortgage.insurance}%, czyli <fmt:formatNumber type="currency" >${calculations2.insurance}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${testMortgage3}">
                        <td class="td-compare-offers-red">${calculations3.mortgage.insurance}%, czyli <fmt:formatNumber type="currency" >${calculations3.insurance}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
            </tr>
            <tr>
                <td class="td-compare-offers">Odsetki:</td>
                <td class="td-compare-offers-red"><fmt:formatNumber type="currency" >${calculations1.interests}</fmt:formatNumber></td>
                <c:choose>
                    <c:when test="${testMortgage2}">
                        <td class="td-compare-offers-red"><fmt:formatNumber type="currency" >${calculations2.interests}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${testMortgage3}">
                        <td class="td-compare-offers-red"><fmt:formatNumber type="currency" >${calculations3.interests}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
            </tr>
            <tr>
                <td class="td-compare-offers">Koszt całkowity:</td>
                <td class="td-compare-offers-red-bold"><fmt:formatNumber type="currency" >${calculations1.totalCost}</fmt:formatNumber></td>
                <c:choose>
                    <c:when test="${testMortgage2}">
                        <td class="td-compare-offers-red-bold"><fmt:formatNumber type="currency" >${calculations2.totalCost}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${testMortgage3}">
                        <td class="td-compare-offers-red-bold"><fmt:formatNumber type="currency" >${calculations3.totalCost}</fmt:formatNumber></td>
                    </c:when>
                </c:choose>
            </tr>

            <tr>
                <td class="btn-next">
                    <form action="${pageContext.request.contextPath}/mortgageParameters" method="post"
                          modelattribute="userMortgage">
                        <input type="hidden" name="cost" value="${userMortgage.cost}"/>
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
                    <a href="${pageContext.request.contextPath}/listOfAgenciesMortgage?bankId=${calculations1.mortgage.bank.id}&offer=${calculations1.mortgage.offer}&cost=${userMortgage.cost}&amount=${userMortgage.amount}&creditPeriod=${userMortgage.creditPeriod}
&age=${userMortgage.age}&contributionPercent=${userMortgage.contributionPercent}&chooseServiceCharge=${userMortgage.chooseServiceCharge}&chooseInsurance=${userMortgage.chooseInsurance}"
                       class="btn btn-sm btn-outline-success rounded">Wybierz oddział do kontaktu</a>
                </td>
                <c:choose>
                    <c:when test="${testMortgage2}">
                        <td>
                            <a href="${pageContext.request.contextPath}/listOfAgenciesMortgage?bankId=${calculations2.mortgage.bank.id}&offer=${calculations2.mortgage.offer}&cost=${userMortgage.cost}&amount=${userMortgage.amount}&creditPeriod=${userMortgage.creditPeriod}
&age=${userMortgage.age}&contributionPercent=${userMortgage.contributionPercent}&chooseServiceCharge=${userMortgage.chooseServiceCharge}&chooseInsurance=${userMortgage.chooseInsurance}"
                               class="btn btn-sm btn-outline-success rounded">Wybierz oddział do kontaktu</a>
                        </td>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${testMortgage3}">
                        <td>
                            <a href="${pageContext.request.contextPath}/listOfAgenciesMortgage?bankId=${calculations3.mortgage.bank.id}&offer=${calculations3.mortgage.offer}&cost=${userMortgage.cost}&amount=${userMortgage.amount}&creditPeriod=${userMortgage.creditPeriod}
&age=${userMortgage.age}&contributionPercent=${userMortgage.contributionPercent}&chooseServiceCharge=${userMortgage.chooseServiceCharge}&chooseInsurance=${userMortgage.chooseInsurance}"
                               class="btn btn-sm btn-outline-success rounded">Wybierz oddział do kontaktu</a>
                        </td>
                    </c:when>
                </c:choose>
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
