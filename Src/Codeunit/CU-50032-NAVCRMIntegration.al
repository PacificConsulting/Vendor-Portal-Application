codeunit 50032 "NAV CRM Integration"
{

    trigger OnRun()
    begin
        GenerateInvoiceNo('PO/18-19/08/0018');
        //GenerateVehicleTracking('CD/1617/00007');
    end;

    //    [Scope('Internal')]
    procedure GenerateInvoiceNo(InvoiceNo: Code[20]): Text[100]
    var
        SalesSetup: Record 311;
        SalesInvHeader: Record 38;
        HTMLPath: Text[150];
        i: Integer;
        //CSTRep: Report "50036";
        SalesSetup1: Record 312;
        PurchaseHeader: Record 38;
        recVend: Record 23;
    // Purchase_OrderNGL_T: Report "50035";
    // Purchase_OrderFA_T: Report "50036"; //PCPL-0070 
    begin
        SalesSetup1.GET();
        // IF SalesSetup1."WO Sales Invoice Path" = '' THEN
        //     ERROR('Define the HTML file path in Sales Setup.'); //PCPL-0070

        SalesInvHeader.SETRANGE("No.", InvoiceNo);
        IF SalesInvHeader.FINDFIRST THEN BEGIN
            /* PCPL-0070 <<
             IF COPYSTR(SalesSetup1."WO Sales Invoice Path", STRLEN(SalesSetup1."WO Sales Invoice Path"), 1) <> '\' THEN
                 HTMLPath := SalesSetup1."WO Sales Invoice Path" + '\'
             ELSE
                 HTMLPath := SalesSetup1."WO Sales Invoice Path";
 */ //PCPL-0070 >>
            FOR i := 1 TO STRLEN(InvoiceNo) DO BEGIN
                IF (InvoiceNo[i] = '/') OR
                   (InvoiceNo[i] = '\') OR
                   (InvoiceNo[i] = '-') OR
                   (InvoiceNo[i] = '.') THEN
                    InvoiceNo[i] := '_';
            END;

            // IF EXISTS(HTMLPath + InvoiceNo + '.pdf') THEN
            //     ERASE(HTMLPath + InvoiceNo + '.pdf'); //PCPL-0070
            /*
              CLEAR(CSTRep);
              CSTRep.USEREQUESTPAGE := FALSE;
              CSTRep.SETTABLEVIEW(SalesInvHeader);
              CSTRep.SAVEASPDF(HTMLPath + InvoiceNo +'.pdf');*/

            //PCPL-0024 30oct2018
            PurchaseHeader.RESET;
            PurchaseHeader.SETRANGE(PurchaseHeader."No.", SalesInvHeader."No.");
            IF PurchaseHeader.FINDSET THEN BEGIN
                /* PCPL-0070 <<
                recVend.RESET;
                recVend.SETRANGE(recVend."No.", PurchaseHeader."Buy-from Vendor No.");
                IF recVend.FINDFIRST THEN
                   
                    IF recVend."Vendor Posting Group" = 'CR-RM' THEN BEGIN

                        Purchase_OrderNGL_T.SETTABLEVIEW(PurchaseHeader);
                        Purchase_OrderNGL_T.USEREQUESTPAGE(FALSE);
                        Purchase_OrderNGL_T.SAVEASPDF(HTMLPath + InvoiceNo + '.pdf');
                        CLEAR(Purchase_OrderNGL_T);
                    END
                    ELSE BEGIN
                        Purchase_OrderFA_T.SETTABLEVIEW(PurchaseHeader);
                        Purchase_OrderFA_T.USEREQUESTPAGE(FALSE);
                        Purchase_OrderFA_T.SAVEASPDF(HTMLPath + InvoiceNo + '.pdf');
                        CLEAR(Purchase_OrderFA_T);
                    END;
                  */ //PCPL-0070 >>  
            END;
            //PCPL-0025 30oct2018

        END;

        EXIT(InvoiceNo + '.pdf');

    end;
}

