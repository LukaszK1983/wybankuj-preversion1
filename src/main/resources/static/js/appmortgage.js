$(document).ready(function () {
    // mortgageparameters.jsp
    const button = $('button');

    function check() {
        const form = $('form');
        let testCost = true;
        let testAmount = true;
        let testCreditPeriod = true;
        let testAge = true;

        const costElement = $('#formcost');
        const cost = costElement.val();
        const regexCost = new RegExp('^\\d+$');
        const validcost = $('#validcost').hide();
        const validcostbyamount = $('#validcostbyamount').hide();

        if (!regexCost.test(cost) || cost <= 0) {
            validcost.show();
            costElement.css('border', '1px solid #C24754');
            costElement.css('box-shadow', '0 0 10px 1px #C24754');
            testCost = false;
        } else if (cost < 11200) {
            validcostbyamount.text('Minimalna kwota inwestycji to 11200 zł');
            validcostbyamount.show();
            costElement.css('border', '1px solid #C24754');
            costElement.css('box-shadow', '0 0 10px 1px #C24754');
            testCost = false;
        } else {
            costElement.css('border', '1px solid green');
            costElement.css('box-shadow', '0 0 0 0');
            testCost = true;
        }

        const amountElement = $('#formamount');
        const amount = amountElement.val();
        const regexAmount = new RegExp('^\\d{4,8}$');
        const validamount = $('#validamount').hide();
        const validamountbycontribution = $('#validamountbycontribution').hide();

        if (!regexAmount.test(amount) || amount < 1000 || amount > 5000000) {
            validamount.show();
            amountElement.css('border', '1px solid #C24754');
            amountElement.css('box-shadow', '0 0 10px 1px #C24754');
            testAmount = false;
        } else if ((cost - amount) / cost * 100 < 10) {
            const availableAmount = cost - cost * 0.1;
            validamountbycontribution.text("Uwzględniając wymagany wkład własny, maksymalna dostępna kwota" +
                " kredytu to " + availableAmount);
            validamountbycontribution.show();
            amountElement.css('border', '1px solid #C24754');
            amountElement.css('box-shadow', '0 0 10px 1px #C24754');
            testAmount = false;
        } else {
            amountElement.css('border', '1px solid green');
            amountElement.css('box-shadow', '0 0 0 0');
            testAmount = true;
        }

        const creditperiodElement = $('#formcreditperiod');
        const creditperiod = creditperiodElement.val();
        const regexCreditPeriod = new RegExp('^\\d{1,3}$');
        const validcreditperiod = $('#validcreditperiod').hide();

        if (!regexCreditPeriod.test(creditperiod) || creditperiod < 6 || creditperiod > 360) {
            validcreditperiod.show();
            creditperiodElement.css('border', '1px solid #C24754');
            creditperiodElement.css('box-shadow', '0 0 10px 1px #C24754');
            testCreditPeriod = false;
        } else {
            creditperiodElement.css('border', '1px solid green');
            creditperiodElement.css('box-shadow', '0 0 0 0');
            testCreditPeriod = true;
        }

        const ageElement = $('#formage');
        const age = ageElement.val();
        const regexAge = new RegExp('^\\d{1,3}$');
        const validage = $('#validage').hide();

        if (!regexAge.test(age)) {
            validage.show();
            ageElement.css('border', '1px solid #C24754');
            ageElement.css('box-shadow', '0 0 10px 1px #C24754');
            validage.text('Wprowadzono błędne dane');
            testAge = false;
        } else if (age < 18 || age >= 80) {
            validage.show();
            ageElement.css('border', '1px solid #C24754');
            ageElement.css('box-shadow', '0 0 10px 1px #C24754');
            validage.text('Niestety, Twój wiek uniemożliwia zaciągnięcie kredytu');
            testAge = false;
        } else {
            ageElement.css('border', '1px solid green');
            ageElement.css('box-shadow', '0 0 0 0');
            testAge = true;
        }

        const contributionElement = $('#formcontribution');
        contributionElement.val(Math.round(((cost - amount) / cost * 100) * 100) / 100);

        if (testCost === true && testAmount === true && testCreditPeriod === true && testAge === true) {
            form.submit();
        }
    }

    button.on('click', function (e) {
        e.preventDefault();
        const divCost = $('#div-cost-hipo').hide();
        const divAmount = $('#div-amount-hipo').hide();
        const divPeriod = $('#div-period-hipo').hide();
        const divAge = $('#div-age-hipo').hide();
        const divCharge = $('#div-charge-hipo').hide();
        const divInsurance = $('#div-insurance-hipo').hide();
        check();
    });

    // --->

    const imgCost = $('#img-cost');
    const divCost = $('#div-cost-hipo').hide();
    const imgAmount = $('#img-amount');
    const divAmount = $('#div-amount-hipo').hide();
    const imgPeriod = $('#img-period');
    const divPeriod = $('#div-period-hipo').hide();
    const imgAge = $('#img-age');
    const divAge = $('#div-age-hipo').hide();
    const imgCharge = $('#img-charge');
    const divCharge = $('#div-charge-hipo').hide();
    const imgInsurance = $('#img-insurance');
    const divInsurance = $('#div-insurance-hipo').hide();

    imgCost.on('click', function () {
        divPeriod.hide();
        divAge.hide();
        divCharge.hide();
        divInsurance.hide();
        divAmount.hide();
        divCost.show();
    });

    imgAmount.on('click', function () {
        divPeriod.hide();
        divAge.hide();
        divCharge.hide();
        divInsurance.hide();
        divCost.hide();
        divAmount.show();
    });

    imgPeriod.on('click', function () {
        divAge.hide();
        divCharge.hide();
        divInsurance.hide();
        divAmount.hide();
        divCost.hide();
        divPeriod.show();
    });

    imgAge.on('click', function () {
        divPeriod.hide();
        divCharge.hide();
        divInsurance.hide();
        divAmount.hide();
        divCost.hide();
        divAge.show();
    });

    imgCharge.on('click', function () {
        divPeriod.hide();
        divAge.hide();
        divInsurance.hide();
        divAmount.hide();
        divCost.hide();
        divCharge.show();
    });

    imgInsurance.on('click', function () {
        divPeriod.hide();
        divAge.hide();
        divCharge.hide();
        divAmount.hide();
        divCost.hide();
        divInsurance.show();
    });

    // compare offers
    const myArray = [];
    const thCompare = $('#th-compare');
    const inputsCost = $('.input-cost').val();
    const inputsAmount = $('.input-amount').val();
    const inputsPeriod = $('.input-period').val();
    const inputsPercent = $('.input-percent').val();
    const inputsAge = $('.input-age').val();
    const inputsCharge = $('.input-charge').val();
    const inputsInsurance = $('.input-insurance').val();
    const checkboxes = $('.checkbox1');

    checkboxes.on('click', function () {
        checkboxes.not(':checked').prop('disabled', $('.checkbox1:checked').length === 3);

        if (($(this).val() !== myArray[0]) && ($(this).val() !== myArray[1]) && ($(this).val() !== myArray[2]) && myArray.length < 3) {
            myArray.push($(this).val());
        } else if (($(this).val() !== myArray[0]) && ($(this).val() !== myArray[1]) && ($(this).val() !== myArray[2]) && (myArray[0] === undefined || myArray[1] === undefined || myArray[2] === undefined) && myArray.length <= 3) {
            if (undefined === myArray[0]) {
                myArray[0] = $(this).val();
            } else if (undefined === myArray[1]) {
                myArray[1] = $(this).val();
            } else if (undefined === myArray[2]) {
                myArray[2] = $(this).val();
            }
        } else if (myArray.length === 3) {
            if ($(this).val() === myArray[0]) {
                delete myArray[0];
            } else if ($(this).val() === myArray[1]) {
                delete myArray[1];
            } else if ($(this).val() === myArray[2]) {
                delete myArray[2];
            }
        } else {
            if ($(this).val() === myArray[0]) {
                delete myArray[0];
            } else if ($(this).val() === myArray[1]) {
                delete myArray[1];
            } else if ($(this).val() === myArray[2]) {
                delete myArray[2];
            }
        }

        const lastArray = [];
        let partToPaste = '';

        for (let i = 0; i < myArray.length; i++) {
            if (myArray[i] > 0) {
                lastArray.push(myArray[i]);
            }
        }

        if (lastArray.length === 3) {
            partToPaste = '<input type="hidden" name="mortgageId" value="' + lastArray[0] + '">' +
                '  <input type="hidden" name="mortgageId2" value="' + lastArray[1] + '">' +
                '  <input type="hidden" name="mortgageId3" value="' + lastArray[2] + '">';
        } else if (lastArray.length === 2) {
            partToPaste = '<input type="hidden" name="mortgageId" value="' + lastArray[0] + '">' +
                '  <input type="hidden" name="mortgageId2" value="' + lastArray[1] + '">' +
                '  <input type="hidden" name="mortgageId3" value="0">';
        } else if (lastArray.length === 1) {
            partToPaste = '<input type="hidden" name="mortgageId" value="' + lastArray[0] + '">' +
                '  <input type="hidden" name="mortgageId2" value="0">' +
                '  <input type="hidden" name="mortgageId3" value="0">';
        }

        thCompare.html('<form action="/mortgageDetails" method="post" modelattribute="userMortgage">' +
            '' + partToPaste +
            '  <input type="hidden" name="cost" value="' + inputsCost + '">\n' +
            '  <input type="hidden" name="amount" value="' + inputsAmount + '">\n' +
            '  <input type="hidden" name="creditPeriod" value="' + inputsPeriod + '">\n' +
            '  <input type="hidden" name="age" value="' + inputsAge + '">\n' +
            '  <input type="hidden" name="contributionPercent" value="' + inputsPercent + '">\n' +
            '  <input type="hidden" name="chooseServiceCharge" value="' + inputsCharge + '">\n' +
            '  <input type="hidden" name="chooseInsurance" value="' + inputsInsurance + '">\n' +
            '  <input type="submit" value="Porównaj (max. 3)" class="btn btn-sm btn-success rounded" />\n' +
            '</form>');

        if ($('.checkbox1:checked').length === 0) {
            $('#th-compare').html('Porównaj (max. 3)');
        }
    });
});