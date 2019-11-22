//
//  Constant.swift
//  TheChangeRoom
//
//  Created by lakum vishal on 03/01/19.
//  Copyright © 2019 lakum vishalbhai rajeshbhai. All rights reserved.
//

import Foundation
import UIKit

struct API
{
//    static let BASEURL          = "http://stocktakeapi.heliossoftwares.com/" //live
    static let BASEURL          = "http://stockapi.sixwares.com/api/Basic/"
    static let CLIENT           = "ValidateCustomerDetail"
    static let SETUP            = "GetServerAllData"
    static let UPLOAD           = "UploadDataFromMobileToServer"
    static let CUSTOMER         = "ValidateCustomerDetail"
    static let FIRSTSETUP       = "GetUserProfilesData"
    static let SECONDSETUP      = "GetStockCodeData"
    static let TOKEN            = "Otw/X8wPta8="
}

struct FPStockDB
{
    static let SELECT_ALL_FROM  = "SELECT * FROM "
}

struct FPStockTables
{
    static let listPINSNP       = "INSNP"
    static let listPINST1EXT    = "INST1EXT"
    static let listPINST2       = "INST2"
    static let listPINST3       = "INST3"
    static let listPINST3EXT    = "INST3EXT"
    static let listPINST3H      = "INST3H"
    static let listPINST9       = "INST9"
    static let listPINSTK       = "INSTK"
    static let listPSYACG       = "SYACG"
    static let listPSYAPF       = "SYAPF"
    static let listPSYPRF       = "SYPRF"
    static let listPSYUSR       = "SYUSR"
    static let listPSYUSRF      = "SYUSRF"
    static let listPVSCEN       = "VSCEN"
    static let listPVSCNT       = "VSCNT"
    static let listPVSGRP       = "VSGRP"
    static let UpdateHistory    = "UpdateHistory"
}

struct FPStockTablesKey
{
    static let listPINSNP       = ["INSNP_SnapshotID", "INSNP_Description", "INSNP_DateCreated", "INSNP_Created_by", "INSNP_Posted"]
    
    static let listPINST1EXT    = ["INST3EXT_CompanyProfile", "INST3EXT_StockCode", "INST3EXT_DistCentre", "INST3EXT_Profile", "INST3EXT_Batch_SerialNo", "INST3EXT_SnapshotID", "INST3EXT_ExpiryDate", "INST3EXT_LastUpdateBy", "INST3EXT_SourceDevice", "INST3EXT_ISSync"]
    
    static let listPINST2       = ["INST2_CompanyProfile", "INST2_StockCode", "INST2_DistCentre", "INST2_Date", "INST2_Batch_SerialNo", "INST2_ExpiryDate", "INST2_OnhandQty", "INST2_AvailableQty", "INST2_UnitCost", "INST2_GdRcptOrPurInv", "INST2_AuditNo", "INST2_AuditLineNbr", "INST2_BinNumber", "INST2_InvoicedFlag", "INST2_OrigPurchQty", "INST2_Passed", "INST2_Inspector", "INST2_InspDate", "INST2_Coc"]
    
    static let listPINST3       = ["INST3_CompanyProfile", "INST3_StockCode", "INST3_DistCentre", "INST3_Profile", "INST3_Location1", "INST3_Location2", "INST3_Batch_SerialNo", "INST3_Bat_SerMaster", "INST3_OnHandQty", "INST3_StkTakeQty", "INST3_StkTakeDate", "INST3_StkTakeTime", "INST3_CreateDate", "INST3_CreateTime", "INST3_ApplyFlag", "INST3_StkTakeValue", "INST3_SnapshotID", "INST3_Posted", "INST3_Sortkey", "INST3_BinNumber", "INST3_ISSync", "INST3_New", "INST3_Deleted"]
    
    static let listPINST3EXT    = ["INST3EXT_CompanyProfile", "INST3EXT_StockCode", "INST3EXT_DistCentre", "INST3EXT_Profile", "INST3EXT_Batch_SerialNo", "INST3EXT_SnapshotID", "INST3EXT_ExpiryDate", "INST3EXT_LastUpdateBy", "INST3EXT_SourceDevice", "INST3EXT_ISSync", "INST3EXT_New", "INST3EXT_Deleted"]
    
    static let listPINST3H      = "INST3H"
    static let listPINST9       = "INST9"
    
    static let listPINSTK       = ["INSTK_CompanyProfile", "INSTK_StockCode", "INSTK_BarCode", "INSTK_SortKey", "INSTK_LongDesc", "INSTK_ShortDesc", "INSTK_Class", "INSTK_BaseUnit", "INSTK_UnitsOfPrice", "INSTK_AnalysisProfil", "INSTK_UseDirectCodes", "INSTK_PriceGroup", "INSTK_NoteAssembly", "INSTK_StoreLocation2", "INSTK_StoreLocation1", "INSTK_TaxType", "INSTK_UnitWeight", "INSTK_UnitVolume", "INSTK_ReOrderType", "INSTK_Image", "INSTK_AutoPurchase", "INSTK_AutoMake", "INSTK_NonStkPrice", "INSTK_NonStkCost", "INSTK_AbcUnitsSold", "INSTK_AbcUnitsValue", "INSTK_TimesUsed", "INSTK_DaysHistHeld", "INSTK_StkTakeDays", "INSTK_LeadTimeDays", "INSTK_EoqQty", "INSTK_ReorderProfile", "INSTK_Cost1", "INSTK_Cost2", "INSTK_CostMethod", "INSTK_PackBin", "INSTK_DirectProfile", "INSTK_SellAtUnit", "INSTK_TariffCode", "INSTK_ShortDesc2", "INSTK_DispatchUnitId", "INSTK_AllowNegAvail", "INSTK_AllowNegOnhand", "INSTK_MakNegAvail", "INSTK_MaxNegOnhand"]
    
    static let listPSYACG       = ["SYACG_GroupID", "SYACG_Description", "SYACG_InitialMenu", "SYACG_FloatMenu", "SYACG_SecurityCtl", "SYACG_GLLedger", "SYACG_SLLedger", "SYACG_ARLedger", "SYACG_APLedger", "SYACG_FALedger", "SYACG_DefProfile", "SYACG_MdtryProfile", "SYACG_System", "SYACG_DefQueue", "SYACG_MdtryQueue", "SYACG_ReportDir", "SYACG_Filler", "SYACG_NbrOfProfiles", "SYACG_NbrOfQueues", "SYACG_NbrOfUsers"]
    
    static let listPSYAPF       = ["SYAPF_Profile", "SYAPF_AccessGroup"]
    
    static let listPSYPRF       = ["SYPRF_Profile", "SYPRF_Description", "SYPRF_CurrPeriod", "SYPRF_BatchCtl", "SYPRF_RWPath", "SYPRF_NbrOfCtls", "SYPRF_TimesUsed", "SYPRF_Country", "SYPRF_ABNFormat", "SYPRF_ABNDescription", "SYPRF_ABN", "SYPRF_IsDefault"]
    
    static let listPSYUSR       = ["SYUSR_UserId", "SYUSR_Description", "SYUSR_Password", "SYUSR_AccessGroup", "SYUSR_AccessLevel", "SYUSR_LoginFlag", "SYUSR_LoginDate", "SYUSR_LoginTime", "SYUSR_LogoutDate", "SYUSR_LogoutTime", "SYUSR_NbrLoggedIn", "SYUSR_MaxLoginNbr", "SYUSR_AuditCtl", "SYUSR_ProgramId", "SYUSR_ProgramDate", "SYUSR_ProgramTime", "SYUSR_SunMinTime", "SYUSR_SunMaxTime", "SYUSR_MonMinTime", "SYUSR_MonMaxTime", "SYUSR_TueMinTime", "SYUSR_TueMaxTime", "SYUSR_WedMinTime", "SYUSR_WedMaxTime", "SYUSR_ThuMinTime", "SYUSR_ThuMaxTime", "SYUSR_FriMinTime", "SYUSR_FriMaxTime", "SYUSR_SatMinTime", "SYUSR_SatMaxTime", "SYUSR_LogoutMinutes", "SYUSR_ScnSaverMins", "SYUSR_MessageCtl", "SYUSR_UrgentMsgs", "SYUSR_NormalMsgs", "SYUSR_SysMsgCmd", "SYUSR_Filler", "SYUSR_Email", "SYUSR_DeadLoginDelFlag", "SYUSR_ActiveFlag"]
    
    static let listPSYUSRF      = "SYUSRF"
    
    static let listPVSCEN       = ["VSCEN_CompanyProfile", "VSCEN_Centre", "VSCEN_Description", "VSCEN_LinkToCentre", "VSCEN_PriceFrmCentre", "VSCEN_CostFromCentre", "VSCEN_DistCentre", "VSCEN_TimesUsed", "VSCEN_PickSlipDevice", "VSCEN_OfferBackOrder", "VSCEN_NonPostCentre", "VSCEN_DisplayColour", "VSCEN_PrefDeliveryAddress", "VSCEN_IsDefault"]
    
    static let listPVSCNT       = ["VSCNT_CompanyProfile", "VSCNT_UseCentres", "VSCNT_ConsolidateCen", "VSCNT_DistCentDescLn", "VSCNT_DistCentDescSh", "VSCNT_NoOfPrices", "VSCNT_DefaultCstMthd", "VSCNT_Cost1Desc", "VSCNT_Cost2Desc", "VSCNT_ReOrderDefault", "VSCNT_TaxTypeDefault", "VSCNT_MoveDaysDefalt", "VSCNT_StkTakeDayDef", "VSCNT_AnalysisFormat", "VSCNT_StockFormat", "VSCNT_CostFormat", "VSCNT_PriceFormat", "VSCNT_QtyFormat", "VSCNT_WghtFormat", "VSCNT_VolFormat", "VSCNT_UnitSellFormat", "VSCNT_UnitCostFormat", "VSCNT_StoreLocFormat", "VSCNT_UnusedFormat", "VSCNT_AuditNoAt", "VSCNT_AsmRoundUpCent", "VSCNT_InvPayment", "VSCNT_AllowRetention", "VSCNT_GeneralLedger", "VSCNT_DebtorLedger", "VSCNT_CreditorLedger", "VSCNT_SplitPickSlip", "VSCNT_TaxOnFreight", "VSCNT_TaxOnChequeFee", "VSCNT_ChequeFee", "VSCNT_TransferCost", "VSCNT_CurrentPrd", "VSCNT_ForceCustOrdNo", "VSCNT_PutNameForDelv", "VSCNT_Cost2Use4PO", "VSCNT_GetNewETAinGR", "VSCNT_AllowPartInvce", "VSCNT_GLAcctControl", "VSCNT_Ser_BatAtSales", "VSCNT_InvDateDflt", "VSCNT_DiscLvl1", "VSCNT_DiscLvl2", "VSCNT_DiscLvl3", "VSCNT_OverRidePrRata", "VSCNT_AttchSuffToRef", "VSCNT_AvgDaysInWeek", "VSCNT_InvAnalysisCtl", "VSCNT_RebateLedger", "VSCNT_PostGLRoyalty", "VSCNT_MinOrderValue", "VSCNT_CostForMkupChk", "VSCNT_PostSalToParnt", "VSCNT_PrfxRefWithCtr", "VSCNT_PriceAsmbOnlne", "VSCNT_SaleRefCtrDlm", "VSCNT_SaleRefSuffDlm", "VSCNT_SystemMinDate", "VSCNT_SystemMaxDate", "VSCNT_ConsolReorder", "VSCNT_PoInvVarPct", "VSCNT_NoConsAutoPurc", "VSCNT_AllowNegStock", "VSCNT_AllowChgSuplQty", "VSCNT_LinkPoToDiffCtr", "VSCNT_AllowTfrBackOrd", "VSCNT_GST", "VSCNT_ModifyTaxId", "VSCNT_ModTransferCost", "VSCNT_GUIPrint", "VSCNT_PostJobSalesO_P", "VSCNT_SalesSortkey", "VSCNT_AutoPurchSelSuppl", "VSCNT_ValidateBin", "VSCNT_SYSMenu", "VSCNT_AllowSaleActualQty", "VSCNT_RoundSalesCents", "VSCNT_TrialKitting", "VSCNT_Binforordinary", "VSCNT_Std_Yes_No_1", "VSCNT_Std_Yes_No_2", "VSCNT_Std_Yes_No_3", "VSCNT_UseLineLevelGLAct"]
    
    static let listPVSGRP       = ["VSGRP_AccessGroup", "VSGRP_DefCentre", "VSGRP_OvrideCentres", "VSGRP_AllowSalesOrd", "VSGRP_OnLineSo", "VSGRP_UsePackSlip", "VSGRP_OnlinePackSlip", "VSGRP_AllowInv", "VSGRP_OnlineInv", "VSGRP_AllowCred", "VSGRP_OnlineCred", "VSGRP_AllowQuotes", "VSGRP_OnlineQuotes", "VSGRP_AllowSConfirm", "VSGRP_OnlineConfirm", "VSGRP_UnitSellOvride", "VSGRP_PickDevice", "VSGRP_PackDevice", "VSGRP_InvDevice", "VSGRP_CrdDevice", "VSGRP_QuoteDevice", "VSGRP_ConfirmDevice", "VSGRP_PickStationId", "VSGRP_PackStationId", "VSGRP_InvStationId", "VSGRP_CrdStationId", "VSGRP_QuoteStationId", "VSGRP_ConfirmStatnId", "VSGRP_OnlinePurOrd", "VSGRP_PurOrderDevice", "VSGRP_PurOrderStatId", "VSGRP_AllowApproval", "VSGRP_MinMargOveride", "VSGRP_CheckProcCost", "VSGRP_GetCreditInvc", "VSGRP_ListSellOvride", "VSGRP_OverrideCost", "VSGRP_ReleaseHeldOrd", "VSGRP_PrintHeldOrder", "VSGRP_ModClosedPInv", "VSGRP_InvAfterPicksl", "VSGRP_MfgStationId", "VSGRP_MfgOnline", "VSGRP_MfgDevice", "VSGRP_DisplayCosts", "VSGRP_YesNo1", "VSGRP_YesNo2", "VSGRP_YesNo3", "VSGRP_YesNo4", "VSGRP_YesNo5", "VSGRP_YesNo6", "VSGRP_YesNo7", "VSGRP_CBCHQSystaID", "VSGRP_CBCHQDevice", "VSGRP_AllowCBCHQ", "VSGRP_CBRCTSystaID", "VSGRP_CBRCTDevice", "VSGRP_AllowCBRCT", "VSGRP_CRCHQSystaID", "VSGRP_CRCHQDevice", "VSGRP_AllowCRCHQ", "VSGRP_DRINVSystaID", "VSGRP_DRINVDevice", "VSGRP_AllowDRINV", "VSGRP_DRRCTSystaID", "VSGRP_DRRCTDevice", "VSGRP_AllowDRRCT", "VSGRP_INTFRSystaID", "VSGRP_INTFRDevice", "VSGRP_AllowINTFR", "VSGRP_JMJBHSystaID", "VSGRP_JMJBHDevice", "VSGRP_AllowJMJBH", "VSGRP_POGRHSystaID", "VSGRP_POGRHDevice", "VSGRP_AllowPOGRH", "VSGRP_POINVSystaID", "VSGRP_POINVDevice", "VSGRP_AllowPOINV", "VSGRP_STMTSystaID", "VSGRP_STMTDevice", "VSGRP_AllowSTMT", "VSGRP_SVWCHSystaID", "VSGRP_SVWCHDevice", "VSGRP_AllowSVWCH", "VSGRP_CashBook", "VSGRP_DRPOSISystaID", "VSGRP_DRPOSIDevice", "VSGRP_AllowDRPOSI", "VSGRP_DRPOSRSystaID", "VSGRP_DRPOSRDevice", "VSGRP_AllowDRPOSR", "VSGRP_DRPOSCSystaID", "VSGRP_DRPOSCDevice", "VSGRP_AllowDRPOSC", "VSGRP_INPTRSystaID", "VSGRP_INPTRDevice", "VSGRP_AllowINPTR", "VSGRP_MaxPOApproveAmt", "VSGRP_PctgUnitCOstPOGRN", "VSGRP_Allow_GLLines"]
    
    static let UpdateHistory    = "UpdateHistory"
}

struct AES256Encryption
{
    static let key  = "p3s5v8y/B?E(H+MbQeThWmZq4t7w9z$C"
    static let iv   = "E6AE76F8B71A3744"
//    static let key  = "GVOzqoLT16"
//    static let iv   = "E6AE76F8B71A3744"
}

let mainSB = UIStoryboard(name: "Main", bundle: nil)

struct AppColor
{
    
    static let BEHAVIOURBACKGROUND : [UIColor] = [                                                  UIColor.init(hexColorString: "#C1CDD5"),
                                                                                                    UIColor.init(hexColorString: "#A4CD9C"),
                                                                                                    UIColor.init(hexColorString: "#E38EC0"),
                                                                                                    UIColor.init(hexColorString: "#474B4B"),
                                                                                                    UIColor.init(hexColorString: "#1F5B8D"),
                                                                                                    UIColor.init(hexColorString: "#0C2641"),
                                                                                                    UIColor.init(hexColorString: "#2E7EA3"),
                                                                                                    UIColor.init(hexColorString: "#DF8340")]

    static let ALTERNETLISTBACKGROUND : [UIColor] = [UIColor.init(hexColorString: "#FFFFFF"),
                                                     UIColor.init(hexColorString: "#F5F5F5")]

    static let PRIMARY              = UIColor.init(hexColorString: "#2171E5")

    static let PRIMARY_GREEN        = UIColor.init(hexColorString: "#9ed144")
    static let PRIMARY_YELLOW       = UIColor.init(hexColorString: "#EED139")
    
    static let PRIMARY_HEADER_GREEN = UIColor.init(hexColorString: "#008978")

    static let SPINNER_DOT      = UIColor.init(hexColorString: "#028DFE")

    static let BORDER           = UIColor.init(hexColorString: "#DCDCDC")
    
    static let INNER_RING       = UIColor.init(hexColorString: "#F7B844")

    static let APP_BG_FPASSWORD = UIColor.init(hexColorString: "#E6E6E6")
    
    static let PROGRSS_BAR_BG   = UIColor.init(hexColorString: "#EAEAEA")
    
    static let APP_BG           = UIColor.white

    static let ALERT_RED        = UIColor.init(hexColorString: "#F8CFCD")

    static let STATUS_BAR       = UIColor.white
    
    static let ALERT_GREEN      = UIColor.init(hexColorString: "#A1FFA6")
    
    static let TEXTFIELD        = UIColor.init(hexColorString: "#444444")
    
    static let SEARCH_TEXTFIELD = UIColor.init(hexColorString: "#444444")
    
    static let LBL_DARK         = UIColor.init(hexColorString: "#444444")
    
    static let LBL_BLACK        = UIColor.init(hexColorString: "#444444")
    
    static let BTN_WHITE        = UIColor.white
    
    static let LBL_DARK_LIGHT   = UIColor.init(hexColorString: "#444444")
    
    static let LBL_RATE         = UIColor.init(hexColorString: "#444444")

    static let lbl_GRAY         = UIColor.init(hexColorString: "#DADADA")
    
    static let LBL_QUESTION     = UIColor.init(hexColorString: "#808080")
    
    static let LBL_FORGOT_TITLE = UIColor.init(hexColorString: "#444444")
    
    static let LBL_OPTIONS      = UIColor.init(hexColorString: "#8F8F8F")
    //UIColor.init(hexColorString: "#444444")

    static let ALERT_MSG_RED    = UIColor.red
    //UIColor.init(hexColorString: "#444444")

    static let ALERT_MSG_GREEN  = AppColor.PRIMARY

//    static let ALERT_GREEN      = UIColor.init(hexColorString: "#A1FFA6")

    static let ALERT_WHITE      = UIColor.white

    static let MENU_LOCK        = UIColor.init(hexColorString: "#CDCDCD")

    static let MENU_UNLOCK        = UIColor.init(hexColorString: "#41934F")

}


struct MediaAccess {
    static let actionFileTypeHeading = "Select Imge"
    static let actionFileTypeDescription = "Chose Soource Of image"
    static let camera = "Camera"
    static let phoneLibrary = "Phone Library"
    static let video = "Video"
    static let audio = "Audio"
    static let file = "File"
    
    
    static let alertForPhotoLibraryMessage = "App does not have access to your photos. To enable access, tap settings and turn on Photo Library Access."
    
    static let alertForCameraAccessMessage = "App does not have access to your camera. To enable access, tap settings and turn on Camera."
    
    static let alertForVideoLibraryMessage = "App does not have access to your video. To enable access, tap settings and turn on Video Library Access."
    
    
    static let settingsBtnTitle = "Settings"
    static let cancelBtnTitle = "Cancel"
    
}

struct ScreenSize
{
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxLength = max(ScreenSize.width, ScreenSize.height)
    static let minLength = min(ScreenSize.width, ScreenSize.height)
    static let frame = CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.height)
    
    static let Border:CGFloat       = 1.0
    static let ViewCorner:CGFloat   = 5.0

    static func getStatusBarHeight() -> CGFloat{
        
        if DeviceType.iPhoneX{
            return 44.0
        }else{
            return 20.0
        }
    }
}

struct DeviceType
{
    static let iPhone4orLess    = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength < 568.0
    static let iPhone5orSE      = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 568.0
    static let iPhone678        = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 667.0
    static let iPhone678p       = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 736.0
    static let iPhoneX          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 812.0
    
    static let IS_IPAD          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxLength == 1024.0
    static let IS_IPAD_PRO      = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxLength == 1366.0
}



struct Font
{

    static let FontName                     = "FiraSans"

    static let FiraSansMedium12      = UIFont(name: "FiraSans-Medium", size: 14.0)!

    static let FiraSansMedium14      = UIFont(name: "FiraSans-Medium", size: 14.0)!

    static let FiraSansMedium16      = UIFont(name: "FiraSans-Medium", size: 16.0)!

    static let FiraSansMedium18      = UIFont(name: "FiraSans-Medium", size: 18.0)!

    static let FiraSansMedium20      = UIFont(name: "FiraSans-Medium", size: 20.0)!
    
    static let FiraSansExtraLight12      = UIFont(name: "FiraSans-ExtraLight", size: 12.0)!
    static let FiraSansExtraLight14      = UIFont(name: "FiraSans-ExtraLight", size: 14.0)!
    static let FiraSansExtraLight16      = UIFont(name: "FiraSans-ExtraLight", size: 16.0)!
    static let FiraSansExtraLight18      = UIFont(name: "FiraSans-ExtraLight", size: 18.0)!
    static let FiraSansExtraLight20      = UIFont(name: "FiraSans-ExtraLight", size: 20.0)!

    static let FiraSansRegular12    = UIFont(name: "FiraSans-Regular", size: 12.0)!
    static let FiraSansRegular14    = UIFont(name: "FiraSans-Regular", size: 14.0)!
    static let FiraSansRegular16    = UIFont(name: "FiraSans-Regular", size: 16.0)!
    static let FiraSansRegular18    = UIFont(name: "FiraSans-Regular", size: 18.0)!
    static let FiraSansRegular20    = UIFont(name: "FiraSans-Regular", size: 20.0)!

    static let FiraSansBold12      = UIFont(name: "FiraSans-Bold", size: 12.0)!
    static let FiraSansBold14      = UIFont(name: "FiraSans-Bold", size: 14.0)!
    static let FiraSansBold16      = UIFont(name: "FiraSans-Bold", size: 16.0)!
    static let FiraSansBold18      = UIFont(name: "FiraSans-Bold", size: 18.0)!
    static let FiraSansBold20      = UIFont(name: "FiraSans-Bold", size: 20.0)!

}


/*
 
 //MARK:- ~~~~~~~~~~~~~~~ All IBOutlet and Variable
 //MARK:- ~~~~~~~~~~~~~~~ View Controller Life Cycle
 //MARK:- ~~~~~~~~~~~~~~~ UIButton TouchUp Inside Action
 //MARK:- ~~~~~~~~~~~~~~~ UITableView Delegate
 //MARK:- ~~~~~~~~~~~~~~~ UICollectionView Delegate
 //MARK:- ~~~~~~~~~~~~~~~ WebService Methods
 //MARK:- ~~~~~~~~~~~~~~~ Other Methods
 
 */

