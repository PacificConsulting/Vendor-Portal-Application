page 50103 "Purchaser Approvals Lines"
{
    PageType = List;
    SourceTable = "Purchaser Approvals Lines";

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
                    Editable = false;
                }
                field("PO Qty"; Rec."PO Qty")
                {
                }
                field(Approved; Rec.Approved)
                {
                    Visible = false;
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
                    Visible = false;
                }
                field("Requisition Templet Name"; Rec."Requisition Templet Name")
                {
                    Visible = false;
                }
                field("Requisition Batch Name"; Rec."Requisition Batch Name")
                {
                    Visible = false;
                }
                field("Outstanding True"; Rec."Outstanding True")
                {
                    Visible = false;
                }
                field(Close; Rec.Close)
                {
                    Visible = false;
                }
                field("Description 3"; Rec."Description 3")
                {
                    Visible = false;
                }
                field("Material Requisitioned"; Rec."Material Requisitioned")
                {
                    Visible = false;
                }
                field(Remark; Rec.Remark)
                {
                }
                field("USER ID"; Rec."USER ID")
                {
                }
                field("FA Component Category"; Rec."FA Component Category")
                {
                    Visible = false;
                }
                field("Requirement Date"; Rec."Requirement Date")
                {
                    Visible = false;
                }
                field("Product Group Code"; Rec."Product Group Code")
                {
                    Visible = false;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    Visible = false;
                }
                field(Category; Rec.Category)
                {
                }
                field("Variant Code"; Rec."Variant Code")
                {
                }
                field("Approved Date"; Rec."Approved Date")
                {
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    Visible = false;
                }
                field("Approved By"; Rec."Approved By")
                {
                    Visible = false;
                }
                field("Cost Allocation Dimension"; Rec."Cost Allocation Dimension")
                {
                    Visible = false;
                }
                field("Release Date and Time"; Rec."Release Date and Time")
                {
                    Visible = false;
                }
                field("Releaser User ID"; Rec."Releaser User ID")
                {
                    Visible = false;
                }
                field("Approved Date and Time"; Rec."Approved Date and Time")
                {
                    Visible = false;
                }
                field("End Use"; Rec."End Use")
                {
                    Visible = false;
                }
                field("Close UserID"; Rec."Close UserID")
                {
                    Visible = false;
                }
                field("Comment for Close"; Rec."Comment for Close")
                {
                    Visible = false;
                }
                field(Closingqty; Rec.Closingqty)
                {
                }
                field("Vendor Unit_ Price"; Rec."Vendor Unit_ Price")
                {
                    Visible = false;
                }
                field("Vendor Discount %"; Rec."Vendor Discount %")
                {
                    Visible = false;
                }
                field("Lead Time"; Rec."Lead Time")
                {
                    Visible = false;
                }
                field(Availability; Rec.Availability)
                {
                    Visible = false;
                }
                field("Self Life"; Rec."Self Life")
                {
                    Visible = false;
                }
                field(Observation; Rec.Observation)
                {
                    Visible = false;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    Visible = false;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    Visible = false;
                }
                field(Selected; Rec.Selected)
                {
                    Visible = false;
                }
                field("Mail Already Sent"; Rec."Mail Already Sent")
                {
                    Visible = false;
                }
                field("Entry No"; Rec."Entry No")
                {
                    Visible = false;
                }
                field("PO Status"; Rec."PO Status")
                {
                    Visible = false;
                }
                field("Quotation Qty"; Rec."Quotation Qty")
                {
                }
                field("Indent Closing Date"; Rec."Indent Closing Date")
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

