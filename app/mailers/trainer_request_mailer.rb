class TrainerRequestMailer < ApplicationMailer
  # トレーナー申請された人へメール送信
  def send_trainer_request_to_user(trainer_request)
    @trainer_request = trainer_request
    @user = User.find(trainer_request.user_id)
    @trainer = User.find(trainer_request.trainer_id)

    mail(
      from: Const.email.no_reply,
      reply_to: Const.email.no_reply,
      to: @user.email,
      subject: "【#{Const.service.brand_name}】トレーナーから申請がきました。", &:html
    )
  end

  # トレーナー申請した人へメール送信
  def resend_trainer_request_to_trainer(trainer_request)
    @trainer_request = trainer_request
    @user = User.find(trainer_request.user_id)
    @trainer = User.find(trainer_request.trainer_id)

    mail(
      from: Const.email.no_reply,
      reply_to: Const.email.no_reply,
      to: @trainer.email,
      subject: "【#{Const.service.brand_name}】トレーナー申請を出しました。", &:html
    )
  end
end
