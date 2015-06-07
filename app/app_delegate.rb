class AppDelegate

  include MotionToast

  attr_accessor :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'motion-toast'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    @label = UILabel.alloc.init
    @label.frame = [[0, 100], [rootViewController.view.bounds.size.width, 300]]
    @label.textColor = UIColor.blackColor
    @label.numberOfLines = 0

    rootViewController.view.addSubview @label

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    unless RUBYMOTION_ENV == "test"
      # toast_hello_world
      toast_custom
      # toast_nav
    end

    true
  end

  def toast_hello_world
    ToastMaster.new.show "Hello Toasty World!"
  end

  def toast_nav
    toast "Nav",
      type: :nav
  end

  def toast_custom
    toast "Custom",
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
