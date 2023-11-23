page 50105 "Quotes Received2"
{
    PageType = List;
    SourceTable = "Portal Vend Updated Purch Rec";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    Editable = true;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("PO Qty"; Rec."PO Qty")
                {
                    ApplicationArea = All;
                }
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Requisition Line No."; Rec."Requisition Line No.")
                {
                    ApplicationArea = All;
                }
                field("Requisition Templet Name"; Rec."Requisition Templet Name")
                {
                    ApplicationArea = All;
                }
                field("Requisition Batch Name"; Rec."Requisition Batch Name")
                {
                    ApplicationArea = All;
                }
                field("Outstanding True"; Rec."Outstanding True")
                {
                    ApplicationArea = All;
                }
                field(Close; Rec.Close)
                {
                    ApplicationArea = All;
                }
                field("Description 3"; Rec."Description 3")
                {
                    ApplicationArea = All;
                }
                field("Material Requisitioned"; Rec."Material Requisitioned")
                {
                    ApplicationArea = All;
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = All;
                }
                field("USER ID"; Rec."USER ID")
                {
                    ApplicationArea = All;
                }
                field("Selected For PO"; Rec."Selected For PO")
                {
                    ApplicationArea = All;
                }
                field("FA Component Category"; Rec."FA Component Category")
                {
                    ApplicationArea = All;
                }
                field("Requirement Date"; Rec."Requirement Date")
                {
                    ApplicationArea = All;
                }
                field("Product Group Code"; Rec."Product Group Code")
                {
                    ApplicationArea = All;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = All;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = All;
                }
                field("Approved Date"; Rec."Approved Date")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = All;
                }
                field("PO Created"; Rec."PO Created")
                {
                    ApplicationArea = All;
                }
                field("Cost Allocation Dimension"; Rec."Cost Allocation Dimension")
                {
                    ApplicationArea = All;
                }
                field("Release Date and Time"; Rec."Release Date and Time")
                {
                    ApplicationArea = All;
                }
                field("Releaser User ID"; Rec."Releaser User ID")
                {
                    ApplicationArea = All;
                }
                field("Approved Date and Time"; Rec."Approved Date and Time")
                {
                    ApplicationArea = All;
                }
                field("End Use"; Rec."End Use")
                {
                    ApplicationArea = All;
                }
                field("Close UserID"; Rec."Close UserID")
                {
                    ApplicationArea = All;
                }
                field("Comment for Close"; Rec."Comment for Close")
                {
                    ApplicationArea = All;
                }
                field(Closingqty; Rec.Closingqty)
                {
                    ApplicationArea = All;
                }
                field("Vendor Unit_ Price"; Rec."Vendor Unit_ Price")
                {
                    ApplicationArea = All;
                    Caption = 'Vendor Quote Unit Price';
                }
                field("Vendor Discount %"; Rec."Vendor Discount %")
                {
                    ApplicationArea = All;
                }
                field("Lead Time"; Rec."Lead Time")
                {
                    ApplicationArea = All;
                }
                field(Availability; Rec.Availability)
                {
                    ApplicationArea = All;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = All;
                }
                field("Mail Already Sent"; Rec."Mail Already Sent")
                {
                    ApplicationArea = All;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                }
                field("Submit Status"; Rec."Submit Status")
                {
                    ApplicationArea = All;
                }
                field("Submit Date"; Rec."Submit Date")
                {
                    ApplicationArea = All;
                    Caption = 'Quotation Submit Date';
                }
                field("Submit Time"; Rec."Submit Time")
                {
                    ApplicationArea = All;
                }
                field("PO Status"; Rec."PO Status")
                {
                    ApplicationArea = All;
                }
                field("Quotation No"; Rec."Quotation No")
                {
                    ApplicationArea = All;
                }
                field("GST %"; Rec."GST %")
                {
                    ApplicationArea = All;
                }
                field("Freight Included"; Rec."Freight Included")
                {
                    ApplicationArea = All;
                }
                field("Freight Charges"; Rec."Freight Charges")
                {
                    ApplicationArea = All;
                }
                field("Packing & Forwarding"; Rec."Packing & Forwarding")
                {
                    ApplicationArea = All;
                }
                field("Packing & Forwarding Charges"; Rec."Packing & Forwarding Charges")
                {
                    ApplicationArea = All;
                }
                field("Quotation Qty"; Rec."Quotation Qty")
                {
                    ApplicationArea = All;
                }
                field(Brand; Rec.Brand)
                {
                    ApplicationArea = All;
                }
                field("Indent Closing Date"; Rec."Indent Closing Date")
                {
                    ApplicationArea = All;
                }
                field("Payment Terms Portal Use"; Rec."Payment Terms Portal Use")
                {
                    ApplicationArea = All;
                }
                field("PO No"; Rec."PO No")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(CreatePO)
            {
                Caption = 'Create PO';
                Image = Release;
                ApplicationArea = All;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    recpurcha.RESET;
                    recpurcha.SETRANGE(recpurcha."Selected For PO", TRUE);
                    recpurcha.SETRANGE(recpurcha."PO Created", FALSE);
                    IF recpurcha.FINDFIRST THEN BEGIN
                        fvend := recpurcha."Vendor No.";
                        floca := recpurcha."Location Code";
                    END;

                    recpurchb.RESET;
                    recpurchb.SETRANGE(recpurchb."Selected For PO", TRUE);
                    recpurchb.SETRANGE(recpurchb."PO Created", FALSE);
                    IF recpurchb.FINDSET THEN BEGIN
                        REPEAT
                            IF (recpurchb."Vendor No." <> fvend) OR (recpurchb."Location Code" <> floca) THEN BEGIN
                                ERROR('Mismatch Enties selected');
                            END;
                        UNTIL recpurchb.NEXT = 0
                    END;

                    Rec.PurchaseOrderCreation;
                end;
            }
        }
    }

    var
        recpurcha: Record "Portal Vend Updated Purch Rec";
        recpurchb: Record "Portal Vend Updated Purch Rec";
        fvend: Code[30];
        floca: Code[30];
}

