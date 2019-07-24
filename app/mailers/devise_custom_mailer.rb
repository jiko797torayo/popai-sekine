class DeviseCustomMailer < Devise::Mailer
  # 初回登録時と、登録後にメアドを変更した場合に、メアド確認メールを送信
  def confirmation_instructions(record, token, opts = {})
    opts[:from]     = Const.email.no_replay
    opts[:reply_to] = Const.email.no_replay
    opts[:subject]  = "【#{Const.service.brand_name}】メール認証を完了させてください。"
    @token = token
    devise_mail(record, :confirmation_instructions, opts)
  end
end
