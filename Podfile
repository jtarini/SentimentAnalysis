platform :ios, '10.0'
use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

target 'SentimentAnalysis' do
  use_frameworks!

  target 'SentimentAnalysisTests' do
    inherit! :search_paths
    pod 'Moya-ObjectMapper/RxSwift'
    pod 'Swinject'
    pod 'DZNEmptyDataSet'
  end

  target 'SentimentAnalysisUITests' do
    inherit! :search_paths
    pod 'RxBlocking'
  end

end
