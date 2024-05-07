#
#  Be sure to run `pod spec lint MVoIP.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#


Pod::Spec.new do |s|


  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #


  s.name         = "PRongCloudIM"
  s.version      = "2.0.0"
  s.summary      = "RongCloud IM SDK Private.(如果看不到最新版本，请使用 pod repo update 命令更新一下本地pod仓库，从 2.9.0 版本开始这里不再包含 CallKit 和 CallLib 类库的管理，音视频服务升级为融云自有音视频，2.9.0 版本之前用户请根据站内信提示更新)"


  s.description  = <<-DESC
                   RongCloud IM SDK for iOS.


                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC


  s.homepage     = "http://rongcloud.cn/"
  s.license      = { :type => "Copyright", :text => "Copyright 2014 Rong Cloud" }
  s.author             = { "litao" => "litao@rongcloud.cn" }
  s.social_media_url   = "http://www.rongcloud.cn"
  s.platform     = :ios, "8.0"
  s.source       = { :http => "https://downloads.rongcloud.cn/Rong_Cloud_iOS_IM_SDK_v2_8_1_Stable.zip" }
  #s.default_subspec = 'IMLib', 'IMKit'
  s.requires_arc = true

  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  s.subspec 'IMLibCore' do |core|
    core.vendored_frameworks = "RongCloudIM/RongIMLibCore.xcframework"
    core.resources = "RongCloudIM/RCConfig.plist"
    core.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  s.subspec 'ChatRoom' do |cr|
    cr.vendored_frameworks = "RongCloudIM/RongChatRoom.xcframework"
    cr.dependency 'RongCloudIM/IMLibCore'
    cr.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end
  
  s.subspec 'CustomerService' do |cs|
    cs.vendored_frameworks = "RongCloudIM/RongCustomerService.xcframework"
    cs.dependency 'RongCloudIM/IMLibCore'
    cs.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end
  
  s.subspec 'Discussion' do |discussion|
    discussion.vendored_frameworks = "RongCloudIM/RongDiscussion.xcframework"
    discussion.dependency 'RongCloudIM/IMLibCore'
    discussion.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end
  
  s.subspec 'PublicService' do |ps|
    ps.vendored_frameworks = "RongCloudIM/RongPublicService.xcframework"
    ps.dependency 'RongCloudIM/IMLibCore'
    ps.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end
  
  s.subspec 'Location' do |rtl|
    rtl.vendored_frameworks = "RongCloudIM/RongLocation.xcframework"
    rtl.dependency 'RongCloudIM/IMLibCore'
    rtl.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  s.subspec 'IMLib' do |lib|
    lib.vendored_frameworks = "RongCloudIM/RongIMLib.xcframework"
    lib.dependency 'RongCloudIM/IMLibCore'
    lib.dependency 'RongCloudIM/ChatRoom'
    lib.dependency 'RongCloudIM/Discussion'
    lib.dependency 'RongCloudIM/PublicService'
    lib.dependency 'RongCloudIM/CustomerService'
    lib.dependency 'RongCloudIM/Location'
    lib.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
  end

  s.subspec 'IMKit' do |kit|
    kit.resources = "RongCloudIM/RongCloud.bundle", "RongCloudIM/en.lproj", "RongCloudIM/zh-Hans.lproj", "RongCloudIM/ar.lproj", "RongCloudIM/Emoji.plist", "RongCloudIM/RCColor.plist"
    kit.vendored_frameworks = "RongCloudIM/RongIMKit.xcframework"
    kit.dependency 'RongCloudIM/IMLib'
    # kit.dependency 'RongCloudIM/ChatRoom'
    # kit.dependency 'RongCloudIM/CustomerService'
    # kit.dependency 'RongCloudIM/Discussion'
    # kit.dependency 'RongCloudIM/PublicService'
    # kit.dependency 'RongCloudIM/Location'
  end

  s.subspec 'RongSticker' do |rs|
    rs.resources = "RongCloudIM/RongSticker.bundle", "RongCloudIM/en.lproj", "RongCloudIM/zh-Hans.lproj", "RongCloudIM/ar.lproj"
    rs.vendored_frameworks = "RongCloudIM/RongSticker.xcframework"
    rs.dependency 'RongCloudIM/IMKit'
  end
  
  s.subspec 'Sight' do |st|
    st.vendored_frameworks = "RongCloudIM/RongSight.xcframework"
    st.dependency 'RongCloudIM/IMKit'
  end

  s.subspec 'ContactCard' do |ccd|
    ccd.vendored_frameworks = "RongCloudIM/RongContactCard.xcframework"
    ccd.dependency 'RongCloudIM/IMKit'
  end

end
