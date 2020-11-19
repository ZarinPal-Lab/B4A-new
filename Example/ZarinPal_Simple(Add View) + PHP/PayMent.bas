﻿B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=9.9
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region

Sub Process_Globals
	Dim Merchand_Id As String
	Dim YourURL As String
	Dim YourData As Map
	Dim Amount As String
	Dim Description As String
	Dim Email As String
	Dim phone As String
End Sub

Sub Globals
	Private AH_ZarinPal_Simple1 As AH_ZarinPal_Simple
End Sub

Sub Activity_Create(FirstTime As Boolean)
	AH_ZarinPal_Simple1.Initialize(Me,"AH_ZarinPal_Simple1")'x برای متغیر اولی حتما همین باشه و برای متغیر دومی اونت نیم دلخواهتون رو بزنید که بعد از پرداخت با اون اونت سابتون اجرا بشه
	Activity.AddView(AH_ZarinPal_Simple1.Get_View,0,0,100%x,100%y)'x با این کد لایبری رو به اکتیوتی تون اضافه میکنید
	AH_ZarinPal_Simple1.Merchand_Id(Merchand_Id)'x مرچند کدی که از زرین پال گرفتین رو در اینجا وارد کنید
	AH_ZarinPal_Simple1.YourURL(YourURL)'x آدرس پوشه لایبری رو بدون کارکتر / در آخر وارد کنید
	AH_ZarinPal_Simple1.YourData(YourData)'x اطلاعات اضافی که بصورت مپ به لایبری می دهید و لایبری بصورت جیسون میفرسته به پی اچ پی ها و اینکه میتونید در پی اچ پی وریفای ازش استفاده کنید
	AH_ZarinPal_Simple1.Amount = Amount 'قیمت به تومان
	AH_ZarinPal_Simple1.Description = Description 'x توضیحاتی درباره محصولی که میخواهید بابت آن پولی دریافت کنید
	AH_ZarinPal_Simple1.Email = Email 'x اگه نمی خواید که از کاربرتون ایمیل دریافت کنید که در اینجا وارد بشه میتونید این کد را پاک کنید
	AH_ZarinPal_Simple1.phone = phone 'x اگه نمی خواید که از کاربرتون شماره دریافت کنید که در اینجا وارد بشه میتونید این کد را پاک کنید
	AH_ZarinPal_Simple1.Start_Pay'x تمامی کد ها رو باید قبل از این کد بنویسید.
End Sub

Private Sub Activity_KeyPress (KeyCode As Int) As Boolean 'ignore
	Select KeyCode
		Case KeyCodes.KEYCODE_BACK
			Dim a As Int
			a = Msgbox2("آیا می خواهید از صفحه پرداخت خارج شوید؟"&CRLF&"خروج شما باعث لغو پرداخت می شود؟","خارج شدن از پرداخت","خارج می شوم","به پرداخت ادامه می دهم","",Null)
			If a = DialogResponse.POSITIVE Then
				Activity.Finish
			End If
			Return True
	End Select
End Sub

Sub AH_ZarinPal_Simple1_Request (Status As String, Kod_Payment As String)
	If Status = "100" Or Status = "101" Then
		''//پرداخت موفق
	Else
		''//پرداخت ناموفق
	End If
	Activity.Finish
End Sub

Sub AH_ZarinPal_Simple1_ProgressDialog (Dialog As String , Visible As Boolean)
	'برای شخصی سازی بیشتر لایبری شما این امکان رو دارید تا بتونید دیالوگ های لایبری رو خودتون با شخصی سازی خودتون مدیریت کنید
	If Visible = True Then
		'دیالوگ باز
		ProgressDialogShow2(Dialog,True)
	Else
		'دیالوگ بسته
		ProgressDialogHide
	End If
End Sub

Sub AH_ZarinPal_Simple1_Messaging (Message As String ,Titel As String)
	'در قسمتی از لایبری وقتی که پرداخت از طریف زرین پال انتقال پیدا میکنه به اپلیکیشن تا از خود اپلیکیشن زرین پال پرداخت انجام بشه اپ خودکار پیغام خطایی رو به کاربر نشون میده با نزاشتن این ساب پیغام خطا نمایش داده نمی شود بهتر هست که مسیج باکس سفارشی خو را تنظیم کنید
	Msgbox(Message,Titel)
End Sub