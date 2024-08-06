class YCL_LANG_CHANGE_SESSION definition
  public
  final
  create public .

public section.

  methods OPEN_SESSION_HE .
  methods OPEN_SESSION_EN .
protected section.
private section.

  methods CALL_SESSION
    importing
      !IV_LANGU type SY-LANGU .
ENDCLASS.



CLASS YCL_LANG_CHANGE_SESSION IMPLEMENTATION.


  METHOD call_session.

    DATA:
      lv_task TYPE string.

    lv_task = 'LOGIN_' && sy-uname.

    SET LOCALE LANGUAGE iv_langu.

    CALL FUNCTION 'ABAP4_LEAVE_TO_TRANSACTION' STARTING NEW TASK lv_task DESTINATION 'NONE'
      EXPORTING
        tcode = 'SMEN'. " Transaction Code

  ENDMETHOD.


  METHOD open_session_en.

    call_session( iv_langu = 'E' ).

  ENDMETHOD.


  METHOD open_session_he.

    call_session( iv_langu = 'B' ).

  ENDMETHOD.
ENDCLASS.
