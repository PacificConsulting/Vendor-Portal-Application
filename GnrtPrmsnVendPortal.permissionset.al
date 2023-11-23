permissionset 50109 GnrtPrmsnVendPortal
{
    Assignable = true;
    Permissions = tabledata Brand = RIMD,
        tabledata "Item Vendor Catalog" = RIMD,
        tabledata "Payment Terms PortalUse" = RIMD,
        tabledata "Portal Vend Updated Purch Rec" = RIMD,
        tabledata "Purchaser Approvals Lines " = RIMD,
        tabledata "Specification Details" = RIMD,
        tabledata "Specification Header" = RIMD,
        table Brand = X,
        table "Item Vendor Catalog" = X,
        table "Payment Terms PortalUse" = X,
        table "Portal Vend Updated Purch Rec" = X,
        table "Purchaser Approvals Lines " = X,
        table "Specification Details" = X,
        table "Specification Header" = X,
        codeunit "Get Entry No" = X,
        codeunit "NAV CRM Integration" = X,
        page "Manufacturer Details" = X,
        page "Payment Terms PortalUse" = X,
        page "Purchaser Approvals Lines" = X,
        page "Quotes Received" = X,
        page "Quotes Received2" = X,
        page "Specification Header" = X,
        page "Specification Sub-Form" = X,
        page "Vendor Catalog" = X;
}