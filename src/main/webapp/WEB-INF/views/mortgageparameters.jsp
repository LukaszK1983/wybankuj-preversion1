<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Wprowadzanie danych do symulacji</title>
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
    <h3 class="h3-details">Dane do symulacji kredytu hipotecznego</h3>

    <div class="form-loan-details rounded">
        <form action="${pageContext.request.contextPath}/mortgageParameters" method="post"
              modelAttribute="userMortgage">
            <div class="form-group">
                <label for="formcost" class="label-title">Koszt zakupu lub budowy nieruchomości:</label>
                <div style="display: inline-block">
                    <div style="width: 90%; float: left;">
                        <input type="text" class="form-control" id="formcost"
                               placeholder="Wprowadź kwotę planowanej inwestycji, np. zakup + remont" name="cost">
                    </div>
                    <div style="width: 10%; text-align: center; float: right;">
                        <img src="${pageContext.request.contextPath}/img/info3.png" style="width: 50%; height: 6%"
                             id="img-cost" alt="Pomoc">
                    </div>
                </div>
                <div class="invalid-feedback" id="validcost">Wprowadzono błędne dane</div>
                <div class="invalid-feedback" id="validcostbyamount"></div>
            </div>
            <div class="form-group">
                <label for="formamount" class="label-title">Kwota kredytu:</label>
                <div style="display: inline-block">
                    <div style="width: 90%; float: left;">
                        <input type="text" class="form-control" id="formamount"
                               placeholder="Wprowadź kwotę z przedziału 1000 - 5000000" name="amount">
                    </div>
                    <div style="width: 10%; text-align: center; float: right;">
                        <img src="${pageContext.request.contextPath}/img/info3.png" style="width: 50%; height: 6%"
                             id="img-amount" alt="Pomoc">
                    </div>
                </div>
                <div class="invalid-feedback" id="validamount">Wprowadzono błędne dane</div>
                <div class="invalid-feedback" id="validamountbycontribution"></div>
            </div>
            <div class="form-group">
                <label for="formcreditperiod" class="label-title">Okres kredytowania:</label>
                <div style="display: inline-block">
                    <div style="width: 90%; float: left;">
                        <input type="text" class="form-control" id="formcreditperiod"
                               placeholder="Wprowadź okres kredytu z przedziału 6 - 360" name="creditPeriod">
                    </div>
                    <div style="width: 10%; text-align: center; float: right;">
                        <img src="${pageContext.request.contextPath}/img/info3.png" style="width: 50%; height: 6%"
                             id="img-period" alt="Pomoc">
                    </div>
                </div>
                <div class="invalid-feedback" id="validcreditperiod">Wprowadzono błędne dane</div>
            </div>
            <div class="form-group">
                <input type="hidden" class="form-control" id="formcontribution" name="contributionPercent" value="">
            </div>
            <div class="form-group">
                <label for="formage" class="label-title"> Twój wiek:</label>
                <div style="display: inline-block">
                    <div style="width: 90%; float: left;">
                        <input type="text" class="form-control" id="formage" placeholder="Wprowadź Twój wiek"
                               name="age">
                    </div>
                    <div style="width: 10%; text-align: center; float: right;">
                        <img src="${pageContext.request.contextPath}/img/info3.png" style="width: 50%; height: 6%"
                             id="img-age" alt="Pomoc">
                    </div>
                </div>
                <div class="invalid-feedback" id="validage"></div>
            </div>
            <div class="form-group">
                <label for="formservicecharge" class="label-title">Prowizja za uruchomienie:</label>
                <div style="display: inline-block">
                    <div style="width: 90%; float: left;">
                        <select name="chooseServiceCharge" id="formservicecharge" class="form-control show-tick">
                            <option value="yes">TAK</option>
                            <option value="no">NIE</option>
                        </select>
                    </div>
                    <div style="width: 10%; text-align: center; float: right;">
                        <img src="${pageContext.request.contextPath}/img/info3.png" style="width: 50%; height: 6%"
                             id="img-charge" alt="Pomoc">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="forminsurance" class="label-title">Ubezpieczenie kredytu:</label>
                <div style="display: inline-block">
                    <div style="width: 90%; float: left;">
                        <select name="chooseInsurance" id="forminsurance" class="form-control show-tick">
                            <option value="yes">TAK</option>
                            <option value="no">NIE</option>
                        </select>
                    </div>
                    <div style="width: 10%; text-align: center; float: right;">
                        <img src="${pageContext.request.contextPath}/img/info3.png" style="width: 50%; height: 6%"
                             id="img-insurance" alt="Pomoc">
                    </div>
                </div>
            </div>
            <div class="btn-next">
                <button type="submit" class="btn btn-sm btn-primary rounded">DALEJ</button>
            </div>
        </form>
    </div>

    <div class="form-loan-details-info rounded" id="div-cost-hipo">
        <p class="form-p-info-mini">Wprowadź łączny koszt, jaki planujesz ponieść w związku z zakupem lub budową
            nieruchomości.</p>
    </div>
    <div class="form-loan-details-info rounded" id="div-amount-hipo">
        <p class="form-p-info-mini">Wprowadź wysokość kwoty kredytu, o którą chcesz zawnioskować.</p>
    </div>
    <div class="form-loan-details-info rounded" id="div-period-hipo">
        <p class="form-p-info-mini">Wprowadź liczbę miesięcy, w trakcie których chcesz spłacać kredyt.</p>
    </div>
    <div class="form-loan-details-info rounded" id="div-age-hipo">
        <p class="form-p-info-mini">Wprowadź swój wiek w latach.</p>
    </div>
    <div class="form-loan-details-info rounded" id="div-charge-hipo">
        <p class="form-p-info">Jeśli wybierzesz "NIE", zobaczysz tylko te oferty, w których nie ma prowizji za
            uruchomienie kredytu. Wybierając "TAK", zostaną wygenerowane oferty ze wszystkimi możliwościami.</p>
    </div>
    <div class="form-loan-details-info rounded" id="div-insurance-hipo">
        <p class="form-p-info">Jeśli wybierzesz "NIE", zobaczysz tylko te oferty, w których nie ma ubezpieczenia
            kredytu. Wybierając "TAK", zostaną wygenerowane oferty ze wszystkimi możliwościami.</p>
    </div>
</div>

<div class="div-footer">
    <%@ include file="/WEB-INF/JSPF/footer.jspf" %>
</div>
</body>
</html>
