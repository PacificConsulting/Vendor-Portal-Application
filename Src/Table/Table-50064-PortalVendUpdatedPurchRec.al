table 50064 "Portal Vend Updated Purch Rec"
{
    // Author        Code      Documentation
    // Venkatesh     VK001     To print Description of variant code
    // Nandesh       NG001     To List Items according to category selected on Indent Header


    fields
    {
        field(1; "Entry Type"; Option)
        {
            OptionCaption = 'Indent,Posted Indent';
            OptionMembers = Indent,"Posted Indent";
        }
        field(2; "Document No."; Code[20])
        {
            // TableRelation = "Indent Header"."No." WHERE("Entry Type" = FIELD("Entry Type"));
            //This property is currently not supported
            //TestTableRelation = true;
            //ValidateTableRelation = true;

            trigger OnValidate()
            begin
                recPAL.RESET;
                recPAL.SETRANGE("Document No.", "Document No.");
                recPAL.SETRANGE("Vendor No.", "Vendor No.");
                recPAL.SETRANGE("No.", "No.");
                IF recPAL.FINDSET THEN BEGIN
                    REPEAT
                        recPAL."PO Status" := recPAL."PO Status"::Revised;
                        recPAL.MODIFY;
                    UNTIL recPAL.NEXT = 0;
                END;
            end;
        }
        field(3; "Line No."; Integer)
        {
            Editable = false;
        }
        field(4; Date; Date)
        {

            trigger OnValidate()
            begin
                //TestApprove();
            end;
        }
        field(5; Type; Option)
        {
            OptionCaption = ' ,G/L Account,Item,,Fixed Asset';
            OptionMembers = " ","G/L Account",Item,,"Fixed Asset","Charge (Item)";
        }
        field(6; "No."; Code[20])
        {
            TableRelation = IF (Type = CONST(Item)) Item."No."
            ELSE
            IF (Type = CONST("G/L Account")) "G/L Account"."No."
            ELSE
            IF (Type = CONST("Fixed Asset")) "Fixed Asset"."No.";

            trigger OnValidate()
            begin
                recPAL.RESET;
                recPAL.SETRANGE("Document No.", "Document No.");
                recPAL.SETRANGE("Vendor No.", "Vendor No.");
                recPAL.SETRANGE("No.", "No.");
                IF recPAL.FINDSET THEN BEGIN
                    REPEAT
                        recPAL."PO Status" := recPAL."PO Status"::Revised;
                        recPAL.MODIFY;
                    UNTIL recPAL.NEXT = 0;
                END;
                /*
                TestApprove();
                IF indentheader.GET("Document No.") THEN
                  "Location Code" := indentheader."Location Code";
                
                
                
                CASE Type OF
                  Type::"G/L Account":
                    BEGIN
                 GLAcc.GET("No.");
                      GLAcc.CheckGLAcc;
                      Description := GLAcc.Name;
                     "Unit of Measure Code" :='';
                     "Item Category Code"  :=  GLAcc."Gen. Prod. Posting Group";
                     Category := indentheader.Category;
                //     indentheader.TESTFIELD(indentheader."Material category");
                //      indentheader.TESTFIELD(indentheader.Purpose);
                
                    END;
                
                
                    Type::Item:
                      BEGIN
                      TESTFIELD("No.");
                      Item.GET("No.");
                      Item.TESTFIELD(Blocked,FALSE);
                      IF Item."Blocked Type" = Item."Blocked Type" :: Indent THEN
                        ERROR('Blocked Type must not be Indent for this Item');
                
                      Item.TESTFIELD("Inventory Posting Group");
                      Item.TESTFIELD("Gen. Prod. Posting Group");
                      Description := Item.Description;
                      "Description 2" := Item."Description 2";
                      "Unit of Measure Code" := Item."Base Unit of Measure";
                      "Item Category Code"  :=  Item."Item Category Code";
                      Category := indentheader.Category;
                      indentheader.TESTFIELD(indentheader."Material category");
                      indentheader.TESTFIELD(indentheader.Purpose);
                      END;
                
                     Type::"Fixed Asset":
                           BEGIN
                             FA.GET("No.");
                             FA.TESTFIELD(Inactive,FALSE);
                             FA.TESTFIELD(Blocked,FALSE);
                             IF FA."Blocked Type" = Item."Blocked Type" :: Indent THEN
                             ERROR('Blocked Type must not be Indent for this Fixed Asset');
                
                             FA.TESTFIELD("Gen. Prod. Posting Group");
                             Description := FA.Description;
                             "Description 2" := FA."Description 2";
                              "Unit of Measure Code" :='';
                              "Item Category Code"  :=  indentheader."Material category";
                               Category := indentheader.Category;
                       //         indentheader.TESTFIELD(indentheader."Material category");
                         //    indentheader.TESTFIELD(indentheader.Purpose);
                
                           END;
                
                END;
                */

            end;
        }
        field(7; "Location Code"; Code[20])
        {
            TableRelation = Location.Code;

            trigger OnValidate()
            begin
                //TestApprove();
            end;
        }
        field(8; Quantity; Decimal)
        {

            trigger OnValidate()
            begin
                //TestApprove();
                //VALIDATE("PO Qty");
            end;
        }
        field(10; "PO Qty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Purchase Line".Quantity WHERE("Indent No." = FIELD("Document No."),
                                                              "Location Code" = FIELD("Location Code"),
                                                              "No." = FIELD("No."),
                                                              "Indent Line No." = FIELD("Line No.")));
            Editable = true;
        }
        field(11; Approved; Boolean)
        {

            trigger OnValidate()
            begin

                /*
                IF Approved = TRUE THEN BEGIN
                  IF ("Location Code" ='') THEN
                    ERROR('%1','Location Code should not be blank');
                  IF (Quantity =0) THEN
                    ERROR('%1','Quanity should not 0');
                END;
                
                IF Approved = TRUE THEN
                  TESTFIELD("Requirement Date");
                
                
                IF Approved = TRUE THEN
                  "Approved Date":= WORKDATE;
                */

            end;
        }
        field(12; Description; Text[60])
        {
        }
        field(13; "Description 2"; Text[60])
        {
        }
        field(14; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = IF (Type = CONST(Item)) "Item Unit of Measure".Code WHERE("Item No." = FIELD("No."))
            ELSE
            "Unit of Measure";

            trigger OnValidate()
            var
                UnitOfMeasureTranslation: Record 5402;
            begin
            end;
        }
        field(15; "Requisition Line No."; Integer)
        {
        }
        field(16; "Requisition Templet Name"; Code[30])
        {
        }
        field(17; "Requisition Batch Name"; Code[30])
        {
        }
        field(18; "Outstanding True"; Boolean)
        {
        }
        field(19; Close; Boolean)
        {

            trigger OnValidate()
            begin
                /*
                IF Close = TRUE THEN
                  "Close UserID" := USERID;
                */

            end;
        }
        field(20; "Description 3"; Text[60])
        {
        }
        field(21; "Material Requisitioned"; Text[50])
        {
        }
        field(22; Remark; Text[250])
        {
        }
        field(23; "USER ID"; Text[30])
        {
            Editable = false;
        }
        field(24; "FA Component Category"; Code[20])
        {
            //TableRelation = test3.test;
        }
        field(25; "Requirement Date"; Date)
        {
        }
        field(26; "Product Group Code"; Code[20])
        {
            TableRelation = "Product Group".Code;
        }
        field(27; "Item Category Code"; Code[10])
        {
        }
        field(28; Category; Option)
        {
            OptionCaption = ' ,Engineering,Raw Materials,Lab Equipment,Lab Chemicals,Packing Material,,Safety,Production,Information Technology (IT)';
            OptionMembers = " ",Engineering,"Raw Materials","Lab Equipment","Lab Chemicals","Packing Material",,Safety,Production,"Information Technology (IT)";
        }
        field(29; "Variant Code"; Code[10])
        {
            TableRelation = IF (Type = CONST(Item)) "Item Variant".Code WHERE("Item No." = FIELD("No."));

            trigger OnValidate()
            begin
                /*
                //VK001-BEGIN
                IF "Variant Code" <> '' THEN
                RecVar.SETRANGE(RecVar."Item No.","No.");
                RecVar.SETRANGE(RecVar.Code,"Variant Code");
                  IF RecVar.FINDFIRST THEN
                    Description := RecVar.Description
                    ELSE
                    IF Item.GET("No.") THEN
                    Description := Item.Description;
                
                //VK001-END
                */

            end;
        }
        field(30; "Approved Date"; Date)
        {
            Editable = true;
        }
        field(31; Status; Boolean)
        {

            trigger OnValidate()
            begin
                /*
                IF Status = TRUE THEN
                  "Releaser User ID" := USERID;
                  "Release Date and Time":= CURRENTDATETIME;
                MODIFY;
                */

            end;
        }
        field(32; "Approved By"; Code[50])
        {
            Editable = false;
        }
        field(33; "Cost Allocation Dimension"; Code[20])
        {
            TableRelation = "Dimension Value".Code WHERE("Dimension Code" = CONST('CA'));
        }
        field(34; "Release Date and Time"; DateTime)
        {
        }
        field(35; "Releaser User ID"; Code[50])
        {
        }
        field(36; "Approved Date and Time"; DateTime)
        {
        }
        field(37; "End Use"; Text[50])
        {

            trigger OnLookup()
            begin

                /*
                FSC.RESET;
                  IF PAGE.RUNMODAL(0,FSC)= ACTION::LookupOK THEN
                  "End Use":= FSC.Name;
                */

            end;
        }
        field(39; "Close UserID"; Code[50])
        {
        }
        field(40; "Comment for Close"; Text[100])
        {
        }
        field(41; Closingqty; Decimal)
        {
            CalcFormula = Sum("Warehouse Entry"."Qty. (Base)" WHERE("Location Code" = FIELD("Location Code"),
                                                                     "Item No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(42; "Vendor Unit_ Price"; Decimal)
        {
            Description = '//PCPL/BRB/Portal';
        }
        field(43; "Vendor Discount %"; Decimal)
        {
            Description = '//PCPL/BRB/Portal';
        }
        field(44; "Lead Time"; Text[30])
        {
            Description = '//PCPL/BRB/Portal';
        }
        field(45; Availability; Decimal)
        {
        }
        field(48; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                /*
                IF Vend.GET("Vendor No.") THEN
                  "Vendor Name" := Vend.Name;
                */
                recPAL.RESET;
                recPAL.SETRANGE("Document No.", "Document No.");
                recPAL.SETRANGE("Vendor No.", "Vendor No.");
                recPAL.SETRANGE("No.", "No.");
                IF recPAL.FINDSET THEN BEGIN
                    REPEAT
                        recPAL."PO Status" := recPAL."PO Status"::Revised;
                        recPAL.MODIFY;
                    UNTIL recPAL.NEXT = 0;
                END;

            end;
        }
        field(49; "Vendor Name"; Text[60])
        {
        }
        field(50; Selected; Boolean)
        {
        }
        field(51; "Mail Already Sent"; Boolean)
        {
        }
        field(52; "Entry No"; Integer)
        {
        }
        field(53; "Submit Status"; Code[20])
        {
            Description = '/PCPL/AN/0026/Portal';
        }
        field(54; "Submit Date"; Date)
        {
            Description = '/PCPL/AN/0026/Portal';
        }
        field(55; "Submit Time"; Time)
        {
            Description = '/PCPL/AN/0026/Portal';
        }
        field(56; "Total Amount"; Decimal)
        {
            Description = '/PCPL/AN/0026/Portal';
        }
        field(58; "PO Status"; Option)
        {
            OptionCaption = 'Open,In Progress,Processed For PO,Closed';
            OptionMembers = Open,"In Progress","Processed For PO",Closed;
        }
        field(59; "Selected For PO"; Boolean)
        {
        }
        field(60; "PO Created"; Boolean)
        {
        }
        field(61; "Quotation No"; Code[20])
        {
            Description = 'PCPL/0028';
        }
        field(62; "Freight Included"; Boolean)
        {
            Description = '/PCPL/AN/0026/Portal';
        }
        field(63; "Freight Charges"; Decimal)
        {
            Description = '/PCPL/AN/0026/Portal';
        }
        field(64; "Packing & Forwarding"; Boolean)
        {
            Description = '/PCPL/AN/0026/Portal';
        }
        field(65; "Packing & Forwarding Charges"; Decimal)
        {
            Description = '/PCPL/AN/0026/Portal';
        }
        field(66; "GST %"; Code[10])
        {
            Description = '/PCPL/AN/0026/Portal';
            TableRelation = "GST Group";
        }
        field(67; "Quotation Qty"; Decimal)
        {
        }
        field(68; Brand; Text[30])
        {
            Description = '//38 PCPL';
            TableRelation = Brand."Brand Name";
        }
        field(69; "Indent Closing Date"; Date)
        {
            Description = 'PCPL/BRB';
        }
        field(70; "PO No"; Code[60])
        {
            Description = 'PCPL0024/26OCT2018';
        }
        field(71; "Payment Terms Portal Use"; Code[10])
        {
            Description = 'PCPL0026/26-10-18';
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //TestApprove();
    end;

    trigger OnInsert()
    begin
        /*
        indentline.SETRANGE(indentline."Entry Type","Entry Type");
        indentline.SETRANGE(indentline."Document No.","Document No.");
        IF indentline.FINDLAST THEN
        BEGIN
          "Line No." := indentline."Line No."+10000;
        END ELSE
        BEGIN
         "Line No.":=10000
        END;
        
        //to get date
        indentheader.GET("Document No.");
        indentheader.TESTFIELD(indentheader.Date);
        Rec.Date:=indentheader.Date;
        "Location Code":=indentheader."Location Code";
        "USER ID":=USERID;
        */
        "Line No." := "Line No." + 10000;
        recPAL.RESET;
        recPAL.SETRANGE("Document No.", "Document No.");
        recPAL.SETRANGE("Vendor No.", "Vendor No.");
        recPAL.SETRANGE("No.", "No.");
        IF recPAL.FINDSET THEN BEGIN
            REPEAT
                recPAL."PO Status" := recPAL."PO Status"::Revised;
                recPAL.MODIFY;
            UNTIL recPAL.NEXT = 0;
        END;

    end;

    trigger OnModify()
    begin
        //VALIDATE(Approved)
    end;

    var
        // indentheader: Record 50002;
        // indentline: Record 50003;
        Item: Record 27;
        GLAcc: Record 15;
        FA: Record 5600;
        Text000: Label 'Indnet No. %1:';
        Text001: Label 'The program cannot find this purchase line.';
        NextLineNo: Integer;
        //indentline1: Record 50003;
        outstandqty: Decimal;
        Des: Decimal;
        PurchaseLinesForm: Page "Purchase Lines";
        RecVar: Record 5401;
        //IH: Record 50002;
        ITM: Record 27;
        GL: Record 15;
        RFA: Record 5600;
        FSC: Record 5608;
        Vend: Record 23;
        LineNo: Integer;
        recPAL: Record "Purchaser Approvals Lines";
        //recStru: Record 13795;
        Recpurchaserheader: Record 38;
        RecVendor: Record 23;
        VarEmailSender: Text[150];
        VarRecipaint: Text[150];
        Varsubject: Text[150];
        VarcompName: Text[150];
        reclocation: Record 14;
        //SMTP: Codeunit 400;
        recpurchashline: Record 39;
        recspecificationheader: Record "Specification Header";
        recitem: Record 27;
        //Purchase_OrderNGL_T: Report 50023;
        sr: Integer;
        pdfname: Text[60];
        Recpurchaseline: Record 39;
        RecQuatationRecived: Record "Portal Vend Updated Purch Rec";

    [Scope('Internal')]
    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        DimMgt: Codeunit 408;
    begin
        /*DimMgt.ValidateDimValueCode(FieldNumber,ShortcutDimCode);
        IF "Line No." <> 0 THEN BEGIN
          DimMgt.SaveDocDim(
            DATABASE::Indent,0,"Document No.",
            "Line No.",FieldNumber,ShortcutDimCode);
          MODIFY;
        END ELSE
          DimMgt.SaveTempDim(FieldNumber,ShortcutDimCode);
        */

    end;

    local procedure TestApprove()
    begin

        /*
        IF Approved = TRUE  THEN
            ERROR('%1%2','No Change in Line for line No',"Line No.");
        */

    end;

    local procedure GetIndentHeader()
    begin
        //TESTFIELD("Document No.");
    end;

    [Scope('Internal')]
    procedure InsertPurchLineFromIndentLine(var PurchLine: Record 39)
    var
        PurchInvHeader: Record 38;
        PurchOrderHeader: Record 38;
        PurchOrderLine: Record 39;
        TempPurchLine: Record 39;
        PurchSetup: Record 312;
        TransferOldExtLines: Codeunit 379;
        ItemTrackingMgt: Codeunit 6500;
        NextLineNo: Integer;
        ExtTextLine: Boolean;
        "**sh": Integer;
    //IndentPO: Record 50005;
    begin
        /*
        SETRANGE("Document No.","Document No.");
        
        TempPurchLine := PurchLine;
        IF PurchLine.FIND('+') THEN
          NextLineNo := PurchLine."Line No." + 10000
        ELSE
          NextLineNo := 10000;
        
        IndentPO.RESET;
        IndentPO.SETFILTER(IndentPO."Document No.","Document No.");
        IndentPO.SETRANGE(IndentPO."PO Line No.","Line No.");
        IndentPO.SETRANGE(IndentPO.Type,Type);
        IndentPO.SETFILTER(IndentPO."No.","No.");
        IndentPO.SETFILTER(IndentPO."Location Code","Location Code");
        IF IndentPO.FINDFIRST THEN REPEAT
           "PO Qty"+=IndentPO."P.O.Qty";
         UNTIL IndentPO.NEXT=0;
        
        
        IF PurchInvHeader."No." <> TempPurchLine."Document No." THEN
          PurchInvHeader.GET(TempPurchLine."Document Type",TempPurchLine."Document No.");
        
          PurchLine.INIT;
            REPEAT
              PurchLine."Line No."          :=  NextLineNo;
              PurchLine."Document Type"     :=  TempPurchLine."Document Type";
              PurchLine."Document No."      :=  TempPurchLine."Document No.";
              PurchLine.Type                :=  Type;
              PurchLine.VALIDATE(PurchLine."No.",  "No.") ;
              PurchLine.Description         :=   Description;
              PurchLine."Description 2"        :=   "Description 2";
              //PurchLine."Description 3"        :=   "Description 3";
        //      PurchLine.VALIDATE(PurchLine."Unit of Measure Code",  "Unit of Measure Code") ;
              PurchLine."Unit of Measure Code":= "Unit of Measure Code";
              PurchLine."Location Code"     :=  "Location Code";
              PurchLine."Material Requisition"  := "Material Requisitioned";
              PurchLine."FA Component Category" := "FA Component Category";
              PurchLine."Variant Code"  :=  "Variant Code"; // VK
              //CALCSUMS("PO Qty");
              CALCFIELDS("PO Qty");
              outstandqty := Quantity-"PO Qty";
              PurchLine.VALIDATE(PurchLine.Quantity,outstandqty) ; // Tolerance System
              PurchLine."Indent No." :=    "Document No.";
              PurchLine.VALIDATE(PurchLine."Indent Line No.", "Line No.") ;
              IF outstandqty <>0 THEN BEGIN
                PurchLine.INSERT;
                { //need to check dimension in nav13
                //
                DocDim.RESET;
                DocDim.SETRANGE(DocDim."Document Type",DocDim."Document Type"::Order);
                DocDim.SETRANGE(DocDim."Document No.",PurchLine."Document No.");
                DocDim.SETRANGE(DocDim."Line No.",PurchLine."Line No.");
                DocDim.SETRANGE("Dimension Code",'CA');
                  IF NOT DocDim.FINDFIRST THEN BEGIN
                  DocDim.INIT;
                  DocDim."Table ID" := 39;
                  DocDim."Document Type" := DocDim."Document Type"::Order;
                  DocDim."Document No." := PurchLine."Document No.";
                  DocDim."Line No." := PurchLine."Line No.";
                  DocDim."Dimension Code" := 'CA';
                  DocDim."Dimension Value Code" := PurchLine."Cost Allocation Dimension";
                  DocDim.INSERT;
                  END
                  }
              END ELSE BEGIN
                EXIT;
              END;
        
              NextLineNo := NextLineNo + 10000;
            UNTIL PurchLine.NEXT=0;
        */

    end;

    [Scope('Internal')]
    procedure ShowLineComments()
    var
    // ScheduleDetail: Record 50001;
    // ScheduleForm: Page 50015;
    begin
        /*
        TESTFIELD("Document No.");
        TESTFIELD("Line No.");
        ScheduleDetail.SETRANGE(ScheduleDetail."Entry Type","Entry Type");
        ScheduleDetail.SETRANGE(ScheduleDetail."Document No","Document No.");
        ScheduleDetail.SETRANGE(ScheduleDetail."Indent Line No","Line No.");
        ScheduleDetail.SETRANGE(ScheduleDetail.type,Type);
        ScheduleDetail.SETRANGE(ScheduleDetail.Item,"No.");
        ScheduleForm.SETTABLEVIEW(ScheduleDetail);
        ScheduleForm.RUNMODAL;
        */

    end;

    //[Scope('Internal')]
    procedure PurchaseOrderCreation()
    var
        PurchaseHeader: Record 38;
        PurchaseLine: Record 39;
        PurchasesPayablesSetup: Record 312;
        PortalVendUpdatedPurchRec: Record "Portal Vend Updated Purch Rec";
        NoSeriesManagement: Codeunit 396;
        POCreated: Boolean;
        PortalVendUpdatedPurchRec1: Record "Portal Vend Updated Purch Rec";
    begin
        PortalVendUpdatedPurchRec.RESET;
        PortalVendUpdatedPurchRec.SETRANGE("Vendor No.", Rec."Vendor No.");
        PortalVendUpdatedPurchRec.SETRANGE("Document No.", Rec."Document No.");
        PortalVendUpdatedPurchRec.SETRANGE("Selected For PO", TRUE);
        //PortalVendUpdatedPurchRec.SETRANGE("Location Code","Location Code");
        PortalVendUpdatedPurchRec.SETRANGE("PO Created", FALSE);
        IF PortalVendUpdatedPurchRec.FINDFIRST THEN BEGIN
            PurchaseHeader.RESET;
            PurchaseHeader.INIT;
            PurchaseHeader.VALIDATE("Document Type", PurchaseHeader."Document Type"::Order);
            PurchasesPayablesSetup.GET;
            PurchaseHeader."No." := NoSeriesManagement.GetNextNo(PurchasesPayablesSetup."Order Nos.", 0D, TRUE);
            PurchaseHeader.VALIDATE("Buy-from Vendor No.", PortalVendUpdatedPurchRec."Vendor No.");
            PurchaseHeader.VALIDATE("Location Code", PortalVendUpdatedPurchRec."Location Code");
            PurchaseHeader.VALIDATE("Posting Date", TODAY);
            //PurchaseHeader.VALIDATE(Structure, 'GST');
            IF (Rec."Freight Charges" <> 0) OR ("Packing & Forwarding Charges" <> 0) THEN
                //PurchaseHeader.VALIDATE(Structure, 'GST+FR+PC');
            PurchaseHeader."PO Created" := TRUE;
            PurchaseHeader."Payment Terms Code" := "Payment Terms Portal Use";//pcpl0024..30oct2018
            PurchaseHeader."Order Date" := WORKDATE;//pcpl0024_13Feb2019
            PurchaseHeader.INSERT;
            POCreated := TRUE;
        END ELSE
            ERROR('PO Already Created ');
        IF POCreated THEN BEGIN //PCPL 0028
            PortalVendUpdatedPurchRec.RESET;
            PortalVendUpdatedPurchRec.SETRANGE("Vendor No.", "Vendor No.");
            //PortalVendUpdatedPurchRec.SETRANGE("Document No.","Document No.");
            PortalVendUpdatedPurchRec.SETRANGE("Location Code", "Location Code");
            PortalVendUpdatedPurchRec.SETRANGE("Selected For PO", TRUE);
            PortalVendUpdatedPurchRec.SETRANGE("PO Created", FALSE);
            IF PortalVendUpdatedPurchRec.FINDSET THEN
                REPEAT
                BEGIN
                    PurchaseLine.RESET;
                    PurchaseLine.SETRANGE("Document Type", PurchaseLine."Document Type"::Order);
                    PurchaseLine.SETRANGE("Document No.", PurchaseHeader."No.");
                    IF PurchaseLine.FINDLAST THEN
                        LineNo := PurchaseLine."Line No." + 10000
                    ELSE
                        LineNo := 10000;
                    PurchaseLine.INIT;
                    PurchaseLine.VALIDATE("Document Type", PurchaseHeader."Document Type");
                    PurchaseLine.VALIDATE("Document No.", PurchaseHeader."No.");
                    PurchaseLine.VALIDATE("Buy-from Vendor No.", PurchaseHeader."Buy-from Vendor No.");
                    PurchaseLine.VALIDATE("Line No.", LineNo);
                    PurchaseLine.VALIDATE(Type, PurchaseLine.Type::Item);
                    PurchaseLine.VALIDATE("No.", PortalVendUpdatedPurchRec."No.");
                    PurchaseLine.VALIDATE("Indent No.", PortalVendUpdatedPurchRec."Document No.");
                    PurchaseLine.VALIDATE("Location Code", PortalVendUpdatedPurchRec."Location Code");
                    PurchaseLine.VALIDATE("Unit Cost", PortalVendUpdatedPurchRec."Vendor Unit_ Price");
                    //PurchaseLine.VALIDATE(Quantity,PortalVendUpdatedPurchRec.Quantity);
                    PurchaseLine.VALIDATE(Quantity, PortalVendUpdatedPurchRec.Availability);
                    PurchaseLine.VALIDATE("Indent Line No.", PortalVendUpdatedPurchRec."Line No.");
                    PurchaseLine.VALIDATE("Indent No.", PortalVendUpdatedPurchRec."Document No.");
                    //PurchaseLine.VALIDATE("Quotation No", PortalVendUpdatedPurchRec."Quotation No");
                    PurchaseLine.VALIDATE("Direct Unit Cost", PortalVendUpdatedPurchRec."Vendor Unit_ Price");
                    PurchaseLine.VALIDATE("Line Discount %", PortalVendUpdatedPurchRec."Vendor Discount %");
                    PurchaseLine.VALIDATE("GST Group Code", PortalVendUpdatedPurchRec."GST %");
                    //PurchaseLine.VALIDATE("Freight Charges", PortalVendUpdatedPurchRec."Freight Charges");
                    //PurchaseLine.VALIDATE("Packing & Forwarding Charges", PortalVendUpdatedPurchRec."Packing & Forwarding Charges");
                    //PurchaseLine."Quatation recieved Line No." := PortalVendUpdatedPurchRec."Line No.";//pcpl0024_12Feb2019
                    PurchaseLine.INSERT;
                    POCreated := TRUE;
                END;
                //LineNo+=10000;
                UNTIL PortalVendUpdatedPurchRec.NEXT = 0;
            MESSAGE('PO created' + PurchaseHeader."No.");
            PurchaseHeader.SETRANGE(PurchaseHeader."No.", PurchaseHeader."No.");
            IF PurchaseHeader.FINDFIRST THEN
                PAGE.RUN(50, PurchaseHeader);
            //sendMailToBroker(PurchaseHeader."No.");
            //pcpl002426oc2018start
            Recpurchaseline.RESET;
            Recpurchaseline.SETRANGE(Recpurchaseline."Document No.", PurchaseHeader."No.");
            IF Recpurchaseline.FINDSET THEN BEGIN
                REPEAT
                    RecQuatationRecived.RESET;
                    RecQuatationRecived.SETRANGE(RecQuatationRecived."Document No.", Recpurchaseline."Indent No.");
                    //RecQuatationRecived.SETRANGE(RecQuatationRecived."Quotation No", Recpurchaseline."Quotation No");
                    RecQuatationRecived.SETRANGE(RecQuatationRecived."No.", Recpurchaseline."No.");
                    RecQuatationRecived.SETRANGE(RecQuatationRecived.Availability, Recpurchaseline.Quantity);
                    RecQuatationRecived.SETRANGE(RecQuatationRecived."Vendor No.", Recpurchaseline."Buy-from Vendor No.");
                    RecQuatationRecived.SETRANGE(RecQuatationRecived."Location Code", Recpurchaseline."Location Code");
                    IF RecQuatationRecived.FINDSET THEN BEGIN
                        REPEAT
                            RecQuatationRecived."PO No" := Recpurchaseline."Document No.";
                            RecQuatationRecived.MODIFY;
                        UNTIL RecQuatationRecived.NEXT = 0
                    END
                UNTIL Recpurchaseline.NEXT = 0
            END;

            //pcpl002406octend
        END;

        PortalVendUpdatedPurchRec1.RESET;
        PortalVendUpdatedPurchRec1.SETRANGE("Selected For PO", TRUE);
        IF PortalVendUpdatedPurchRec1.FINDSET THEN
            REPEAT
                PortalVendUpdatedPurchRec1.VALIDATE("PO Created", TRUE);
                PortalVendUpdatedPurchRec1."PO Status" := PortalVendUpdatedPurchRec1."PO Status"::"Processed For PO";
                PortalVendUpdatedPurchRec1.MODIFY;
            UNTIL PortalVendUpdatedPurchRec1.NEXT = 0;

        //PortalVendUpdatedPurchRec1.
    end;

    //[Scope('Internal')]
    procedure sendMailToBroker(DocNo: Code[50])
    begin
        /*
          //pcpl0024--start
          Recpurchaserheader.RESET;
          Recpurchaserheader.SETRANGE(Recpurchaserheader."No.", DocNo);

          IF Recpurchaserheader.FINDFIRST THEN BEGIN

              RecVendor.RESET();
              RecVendor.SETRANGE(RecVendor."No.", Recpurchaserheader."Buy-from Vendor No.");
              IF RecVendor.FINDFIRST THEN
                  VarEmailSender := 'purchase@nglfinechem.com';
              VarRecipaint := RecVendor."Broker Email ID";
              VarcompName := 'NGL Fine Chem Limited';

              Varsubject := 'PO No: ' + Recpurchaserheader."No." + 'for supply of Item to' + Recpurchaserheader."Location Code";//+IndentLine.Description;
              SMTP.CreateMessage('Purchase Team', VarEmailSender, VarRecipaint, Varsubject, '', TRUE);
              //SMTP.CreateMessage('Purchase Team',VarEmailSender,'azharuddin@pacificconsulting.in',Varsubject,'',TRUE);
              SMTP.AppendBody('Dear Sir/Madam');
              SMTP.AppendBody('<br><Br>');
              SMTP.AppendBody('Based on the quotation submitted by you, we are pleased to place the Purchase Order, a copy of which is attached to this email. Please supply within the timelines provided');
              SMTP.AppendBody('<br><Br>');
              SMTP.AppendBody('<table border="0">');
              SMTP.AppendBody('<br><Br>');
              SMTP.AppendBody('<tr style="background-color:#507CD1; color:#fff">');
              SMTP.AppendBody('<th> Date           </th>');
              SMTP.AppendBody('<th> PO No.     </th>');
              SMTP.AppendBody('<th> Item No.       </th>');
              SMTP.AppendBody('<th> Description    </th>');
              SMTP.AppendBody('<th> Quantity       </th>');
              SMTP.AppendBody('<th> UOM            </th>');
              SMTP.AppendBody('<th> Req Date       </th>');
              SMTP.AppendBody('</tr>');
              sr := 0;
              recpurchashline.RESET;
              recpurchashline.SETRANGE(recpurchashline."Document No.", DocNo);
              IF recpurchashline.FINDFIRST THEN BEGIN
                  REPEAT
                      sr += 1;
                      pdfname := 'D:\Specification' + FORMAT(sr);
                      SMTP.AppendBody('<tr style="background-color:#EFF3FB; color:black">');
                      SMTP.AppendBody('<td>' + FORMAT(TODAY) + '</td>');
                      SMTP.AppendBody('<td>' + FORMAT(recpurchashline."Document No.") + '</td>');
                      SMTP.AppendBody('<td>' + recpurchashline."No." + '</td>');
                      SMTP.AppendBody('<td>' + recpurchashline.Description + '</td>');
                      SMTP.AppendBody('<td>' + FORMAT(recpurchashline.Quantity) + '</td>');
                      SMTP.AppendBody('<td>' + recpurchashline."Unit of Measure" + '</td>');
                      SMTP.AppendBody('<td>' + FORMAT(recpurchashline."Requested Receipt Date") + '</td>');
                      SMTP.AppendBody('</tr>');
                      recitem.RESET;
                      recitem.SETRANGE(recitem."No.", recpurchashline."No.");
                      IF recitem.FINDFIRST THEN BEGIN
                          recspecificationheader.RESET;
                          recspecificationheader.SETRANGE(recspecificationheader."Specs ID", recitem."Specs ID");
                          IF recspecificationheader.FINDFIRST THEN BEGIN
                              Purchase_OrderNGL_T.SETTABLEVIEW(recspecificationheader);
                              Purchase_OrderNGL_T.USEREQUESTPAGE(FALSE);
                              Purchase_OrderNGL_T.SAVEASPDF(pdfname + '.pdf');
                              CLEAR(Purchase_OrderNGL_T);
                              //path := 'D:\New folder (2)';
                              SMTP.AddAttachment(pdfname + '.pdf', '');
                          END;
                      END;
                  UNTIL recpurchashline.NEXT = 0;
              END;
              SMTP.AppendBody('</table>');
              SMTP.AppendBody('<table border="0">');
              SMTP.AppendBody('<tr>');
              SMTP.AppendBody('<th> Broker Name:' + RecVendor."Broker Name" + '</th>');
              SMTP.AppendBody('</tr>');
              SMTP.AppendBody('<br><Br>');
              SMTP.AppendBody('<br><Br>');
              SMTP.AppendBody('<br><Br>');
              SMTP.AppendBody('<table border="0">');
              SMTP.AppendBody('<tr>');
              SMTP.AppendBody('<td style="text-align:left" colspan=8><b>' + 'Thanks & Regards' + '</b></td>');
              SMTP.AppendBody('</tr>');
              SMTP.AppendBody('<tr>');
              SMTP.AppendBody('<td style="text-align:left" colspan=8><b>' + 'Purchase Team' + '</b></td>');
              SMTP.AppendBody('</tr>');
              SMTP.AppendBody('<tr style= "color:#507CD1">');
              SMTP.AppendBody('<td style="text-align:left" colspan=8><b> ' + VarcompName + '</b></td>');
              SMTP.AppendBody('</tr>');
              SMTP.AppendBody('</table>');
              SMTP.Send;
          END;
          //PCPL0024--End
      */
    end;
}

