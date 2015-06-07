class AppDelegate

  include MotionToast

  attr_accessor :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'motion-toast'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

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

  def toast_somewhat_sane
    toast type: :custom, preferred_height: 100,
      text: {
        value: "Alright Stop!",
        font: UIFont.boldSystemFontOfSize(22),
        color: UIColor.whiteColor,
      },
      subtitle: {
        value: "Collaborate and listen.  Ice is back with a brand new invention.",
        font: UIFont.systemFontOfSize(14),
        color: UIColor.blackColor,
      },
      bg_color: UIColor.colorWithRed(188, green: 0, blue: 0, alpha: 0.9)
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
