platform :ios, '10.0'
use_frameworks!

# ignore all warnings from all pods
inhibit_all_warnings!

target 'SentimentAnalysis' do
  pod 'Moya-ObjectMapper/RxSwift'
  pod 'Swinject'
  pod 'DZNEmptyDataSet'

  target 'SentimentAnalysisTests' do
    inherit! :search_paths
    pod 'RxBlocking'
  end

end
