class User < ActiveRecord::Base
  has_secure_password
  has_many :images, dependent: :destroy
  has_many :comments, through: :images, dependent: :destroy
  has_many :upvotes
  has_attached_file :profile_img,
                    styles: { medium: "333x333#", thumb: "150x150#" },
                    storage: :s3,
                    url: ":s3_domain_url",
                    path: "/:class/:attachment/:id_partition/:style/:filename",
                    s3_region: ENV["S3_REGION"],
                    s3_credentials: Proc.new{ |a| a.instance.s3_credentials }

  def s3_credentials
    {
      bucket: ENV["S3_BUCKET_NAME"],
      access_key_id: ENV["S3_ACCESS_KEY_ID"],
      secret_access_key: ENV["S3_SECRET_ACCESS_KEY"]
    }
  end

  validates_attachment_content_type :profile_img, content_type: /\Aimage\/.*\Z/
end
