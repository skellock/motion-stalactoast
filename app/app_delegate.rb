class AppDelegate

  include Stalactoast

  attr_accessor :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'motion-stalactoast'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)
    navigationController.navigationBar.barTintColor = UIColor.blueColor

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController

    @button = UIButton.buttonWithType UIButtonTypeRoundedRect
    @button.frame = [[200, 200], [200, 300]]
    @button.setTitle "Toast", forState:UIControlStateNormal
    @button.addTarget self, action: "go:", forControlEvents:UIControlEventTouchUpInside

    rootViewController.view.addSubview @button

    @window.makeKeyAndVisible

    unless RUBYMOTION_ENV == "test"
      # toast_hello_world
      # toast_custom
      # toast_nav
      # toast_somewhat_sane
    end

    true
  end

  def go(sender)
    toast_somewhat_sane
  end

  def toast_hello_world
    toast "Hello Toasty World!"
  end

  def custom_background_view
    # f = CGRectMake(0, 0, 1000, 1000)
    # blur_effect = UIBlurEffect.effectWithStyle(UIBlurEffectStyleDark)
    # blur_view = UIVisualEffectView.alloc.initWithEffect(blur_effect)

    # vibrancy_effect = UIVibrancyEffect.effectForBlurEffect(blur_effect)
    # vibrancy_view = UIVisualEffectView.alloc.initWithEffect(vibrancy_effect)
    # blur_view.contentView.addSubview(vibrancy_view)
    # blur_view
    UIView.new.tap do |v|
      v.backgroundColor = UIColor.colorWithRed(1.0, green:0, blue: 0, alpha: 0.9)
    end
  end

  def toast_somewhat_sane
    toast type: :custom,
      preferred_height: 110,
      duration: 5.0,
      under_status_bar: true,
      text: {
        value: "We're sorry.  The server is being a jerk.  Please try again later.",
        font: UIFont.boldSystemFontOfSize(14),
        color: UIColor.whiteColor,
        shadow_offset: [0, 1],
        shadow_color: UIColor.colorWithRed(0.8, green: 0, blue: 0, alpha: 1.0),
        alignment: :left,
      },
      subtitle: {
        value: "\n500 - Server Error",
        font: UIFont.boldSystemFontOfSize(11),
        color: UIColor.colorWithRed(1.0, green: 0.8, blue: 0.8, alpha: 1.0),
        alignment: :left,
      },
      image: {
        value: UIImage.imageNamed("motion-toast-card"),
        alignment: :left,
        content_mode: :center
      },
      # bg_color: UIColor.colorWithRed(188, green: 0, blue: 0, alpha: 0.9),
      bg_color: UIColor.clearColor,
      bg_view: custom_background_view,
      in_animation: {type: :gravity},
      out_animation: {type: :gravity},
      gravity: 3.0
  end

  def toast_nav
    toast "Nav", type: :nav
  end

  def toast_custom
    toast text: {
        value: "hey",
        color: UIColor.yellowColor,
        font: UIFont.systemFontOfSize(20),
        shadow_offset: 1,
        shadow_color: UIColor.redColor,
        alignment: :left,
      },
      subtitle: {
        value: "This is customized to the point of being ridiculous. " * 5,
        color: UIColor.blueColor,
        font: UIFont.systemFontOfSize(9),
        alignment: :right,
      },
      bg_color: UIColor.greenColor,
      type: :custom,
      preferred_height: 300,
      presentation: :cover,
      under_status_bar: true,
      in_animation: {type: :gravity },
      out_animation: {type: :spring, time: 1},
      spring_damping: 0.2,
      gravity: 4.0
  end

end
