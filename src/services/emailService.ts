import nodemailer from 'nodemailer';
import { config } from '../config';

let transporter: nodemailer.Transporter | null = null;

function getTransporter(): nodemailer.Transporter | null {
  if (transporter) return transporter;

  const { host, port, secure, user, pass } = config.smtp;

  if (!user || !pass) {
    console.warn('⚠️ [EmailService] SMTP_USER or SMTP_PASS is missing in environment variables. OTP codes will be printed to server console.');
    return null;
  }

  transporter = nodemailer.createTransport({
    host,
    port,
    secure,
    auth: {
      user,
      pass,
    },
    tls: {
      rejectUnauthorized: false,
    },
  });

  return transporter;
}

export interface SendOtpParams {
  toEmail: string;
  fullName?: string;
  otpCode: string;
  deviceName?: string;
  ipAddress?: string;
  userAgent?: string;
  expiresInMinutes?: number;
}

export const emailService = {
  /**
   * Send 2FA verification email to user
   */
  send2FAOtp: async ({
    toEmail,
    fullName = 'Quý khách',
    otpCode,
    deviceName = 'Thiết bị lạ',
    ipAddress = 'Chưa xác định',
    expiresInMinutes = 5,
  }: SendOtpParams): Promise<{ success: boolean; error?: string }> => {
    const nowStr = new Intl.DateTimeFormat('vi-VN', {
      timeZone: 'Asia/Ho_Chi_Minh',
      dateStyle: 'medium',
      timeStyle: 'medium',
    }).format(new Date());

    const htmlContent = `
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mã xác thực đăng nhập Tiko BizPOS</title>
  <style>
    body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif; background-color: #f4f6f9; margin: 0; padding: 24px; color: #1e293b; }
    .container { max-width: 520px; margin: 0 auto; background-color: #ffffff; border-radius: 16px; overflow: hidden; box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.05), 0 8px 10px -6px rgba(0, 0, 0, 0.01); border: 1px solid #e2e8f0; }
    .header { background: linear-gradient(135deg, #0070F4 0%, #1E3A8A 100%); padding: 28px 24px; text-align: center; color: #ffffff; }
    .logo-badge { display: inline-flex; width: 44px; height: 44px; background: rgba(255, 255, 255, 0.2); border-radius: 12px; align-items: center; justify-content: center; font-size: 22px; font-weight: 900; margin-bottom: 8px; }
    .title { margin: 0; font-size: 20px; font-weight: 800; letter-spacing: -0.5px; }
    .subtitle { margin: 4px 0 0 0; font-size: 13px; opacity: 0.85; font-weight: 500; }
    .content { padding: 32px 28px; }
    .greeting { font-size: 15px; font-weight: 600; margin-bottom: 12px; color: #0f172a; }
    .message { font-size: 14px; line-height: 1.6; color: #475569; margin-bottom: 24px; }
    .otp-box { background-color: #f8fafc; border: 2px dashed #0070F4; border-radius: 12px; padding: 20px; text-align: center; margin-bottom: 24px; }
    .otp-label { font-size: 12px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 8px; }
    .otp-code { font-size: 34px; font-weight: 900; color: #0070F4; letter-spacing: 8px; font-family: monospace, Courier, sans-serif; }
    .otp-expiry { font-size: 12px; color: #dc2626; font-weight: 600; margin-top: 8px; }
    .device-info { background-color: #f1f5f9; border-radius: 10px; padding: 14px 18px; font-size: 12px; color: #334155; line-height: 1.7; margin-bottom: 24px; }
    .device-info strong { color: #0f172a; }
    .warning { font-size: 12px; color: #94a3b8; line-height: 1.5; border-top: 1px solid #f1f5f9; padding-top: 16px; }
    .footer { background-color: #f8fafc; padding: 16px; text-align: center; font-size: 11px; color: #94a3b8; border-top: 1px solid #e2e8f0; }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <div class="logo-badge">T</div>
      <h1 class="title">Tiko BizPOS</h1>
      <p class="subtitle">Hệ thống Xác thực & Bảo mật 2 Lớp</p>
    </div>
    <div class="content">
      <div class="greeting">Xin chào ${fullName},</div>
      <div class="message">
        Hệ thống phát hiện tài khoản của bạn đang được đăng nhập từ một <strong>thiết bị mới hoặc chưa được tin cậy</strong>. Vui lòng sử dụng mã xác thực OTP dưới đây để hoàn tất đăng nhập:
      </div>
      
      <div class="otp-box">
        <div class="otp-label">MÃ XÁC THỰC CỦA BẠN</div>
        <div class="otp-code">${otpCode}</div>
        <div class="otp-expiry">⏱ Mã này sẽ hết hạn trong ${expiresInMinutes} phút</div>
      </div>

      <div class="device-info">
        <div>📱 <strong>Thiết bị:</strong> ${deviceName}</div>
        <div>🌐 <strong>Địa chỉ IP:</strong> ${ipAddress}</div>
        <div>⏰ <strong>Thời gian:</strong> ${nowStr}</div>
      </div>

      <div class="warning">
        🔒 <strong>Lưu ý bảo mật:</strong> Tuyệt đối không chia sẻ mã này cho bất kỳ ai (kể cả nhân viên hỗ trợ kỹ thuật). Nếu bạn <strong>không</strong> thực hiện yêu cầu đăng nhập này, tài khoản của bạn có thể đã bị lộ mật khẩu. Vui lòng đổi mật khẩu ngay lập tức.
      </div>
    </div>
    <div class="footer">
      Email tự động được gửi từ hệ thống quản lý bán hàng Tiko BizPOS.
    </div>
  </div>
</body>
</html>
    `;

    const mailOptions = {
      from: config.smtp.from,
      to: toEmail,
      subject: `[Tiko BizPOS] Mã xác thực đăng nhập: ${otpCode}`,
      html: htmlContent,
      text: `Mã xác thực đăng nhập Tiko BizPOS của bạn là: ${otpCode}. Mã có hiệu lực trong ${expiresInMinutes} phút từ thiết bị ${deviceName} (IP: ${ipAddress}).`,
    };

    const client = getTransporter();
    if (!client) {
      console.log('====================================================');
      console.log(`🔑 [DEV EMAIL OTP] Gửi tới: ${toEmail}`);
      console.log(`🔑 [DEV EMAIL OTP] Mã OTP:  ${otpCode}`);
      console.log(`🔑 [DEV EMAIL OTP] Thiết bị: ${deviceName} | IP: ${ipAddress}`);
      console.log('====================================================');
      return { success: true };
    }

    try {
      const info = await client.sendMail(mailOptions);
      console.log(`✅ [EmailService] Đã gửi OTP thành công tới ${toEmail} (MessageId: ${info.messageId})`);
      console.log(`🔑 [OTP CODE]: ${otpCode} (Hết hạn sau ${expiresInMinutes} phút)`);
      return { success: true };
    } catch (err: any) {
      console.error(`❌ [EmailService] Lỗi khi gửi email tới ${toEmail}:`, err.message);
      console.log(`🔑 [DEV FALLBACK OTP CODE]: ${otpCode}`);
      return { success: false, error: err.message };
    }
  },
};
