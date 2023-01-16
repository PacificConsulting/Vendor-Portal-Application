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
                }
                field("Document No."; Rec."Document No.")
                {
                }
                field("Line No."; Rec."Line No.")
                {
                    Editable = true;
                }
                field(Date; Rec.Date)
                {
                }
                field(Type; Rec.Type)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Location Code"; Rec."Location Code")
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("PO Qty"; Rec."PO Qty")
                {
                }
                field(Approved; Rec.Approved)
                {
                }
                field(Description; Rec.Description)
                {
                }
                field("Description 2"; Rec."Description 2")
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
                field("Requisition Line No."; Rec."Requisition Line No.")
                {
                }
                field("Requisition Templet Name"; Rec."Requisition Templet Name")
                {
                }
                field("Requisition Batch Name"; Rec."Requisition Batch Name")
                {
                }
                field("Outstanding True"; Rec."Outstanding True")
                {
                }
                field(Close; Rec.Close)
                {
                }
                field("Description 3"; Rec."Description 3")
                {
                }
                field("Material Requisitioned"; Rec."Material Requisitioned")
                {
                }
                field(Remark; Rec.Remark)
                {
                }
                field("USER ID"; Rec."USER ID")
                {
                }
                field("Selected For PO"; Rec."Selected For PO")
                {
                }
                field("FA Component Category"; Rec."FA Component Category")
                {
                }
                field("Requirement Date"; Rec."Requirement Date")
                {
                }
                field("Product Group Code"; Rec."Product Group Code")
                {
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                }
                field(Category; Rec.Category)
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                }
                field("Approved Date"; Rec."Approved Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field("Approved By"; Rec."Approved By")
                {
                }
                field("PO Created"; Rec."PO Created")
                {
                }
                field("Cost Allocation Dimension"; Rec."Cost Allocation Dimension")
                {
                }
                field("Release Date and Time"; Rec."Release Date and Time")
                {
                }
                field("Releaser User ID"; Rec."Releaser User ID")
                {
                }
                field("Approved Date and Time"; Rec."Approved Date and Time")
                {
                }
                field("End Use"; Rec."End Use")
                {
                }
                field("Close UserID"; Rec."Close UserID")
                {
                }
                field("Comment for Close"; Rec."Comment for Close")
                {
                }
                field(Closingqty; Rec.Closingqty)
                {
                }
                field("Vendor Unit_ Price"; Rec."Vendor Unit_ Price")
                {
                    Caption = 'Vendor Quote Unit Price';
                }
                field("Vendor Discount %"; Rec."Vendor Discount %")
                {
                }
                field("Lead Time"; Rec."Lead Time")
                {
                }
                field(Availability; Rec.Availability)
                {
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                }
                field(Selected; Rec.Selected)
                {
                }
                field("Mail Already Sent"; Rec."Mail Already Sent")
                {
                }
                field("Entry No"; Rec."Entry No")
                {
                }
                field("Submit Status"; Rec."Submit Status")
                {
                }
                field("Submit Date"; Rec."Submit Date")
                {
                    Caption = 'Quotation Submit Date';
                }
                field("Submit Time"; Rec."Submit Time")
                {
                }
                field("PO Status"; Rec."PO Status")
                {
                }
                field("Quotation No"; Rec."Quotation No")
                {
                }
                field("GST %"; Rec."GST %")
                {
                }
                field("Freight Included"; Rec."Freight Included")
                {
                }
                field("Freight Charges"; Rec."Freight Charges")
                {
                }
                field("Packing & Forwarding"; Rec."Packing & Forwarding")
                {
                }
                field("Packing & Forwarding Charges"; Rec."Packing & Forwarding Charges")
                {
                }
                field("Quotation Qty"; Rec."Quotation Qty")
                {
                }
                field(Brand; Rec.Brand)
                {
                }
                field("Indent Closing Date"; Rec."Indent Closing Date")
                {
                }
                field("Payment Terms Portal Use"; Rec."Payment Terms Portal Use")
                {
                }
                field("PO No"; Rec."PO No")
                {
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

