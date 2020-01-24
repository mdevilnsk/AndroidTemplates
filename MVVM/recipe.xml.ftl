<?xml version="1.0"?>
<recipe>
    <instantiate from="src/app_package/mvvm_rx/Fragment.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/presentation/${featureName}Fragment.kt" />

    <#if includeInteractors>
        <instantiate from="src/app_package/mvvm_rx/InteractorImpl.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/domain/${featureName}InteractorImpl.kt" />

        <instantiate from="src/app_package/mvvm_rx/Interactor.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/domain/${featureName}Interactor.kt" />

        <instantiate from="test/app_package/mvvm_rx/InteractorTest.kt.ftl"
    		 to="${escapeXmlAttribute(unitTestOut)}/domain/${featureName}InteractorTest.kt" />

        <open file="${escapeXmlAttribute(srcOut)}/domain/${featureName}Interactor.kt" />
        <open file="${escapeXmlAttribute(srcOut)}/domain/${featureName}InteractorImpl.kt" />
        <open file="${escapeXmlAttribute(unitTestOut)}/domain/${featureName}InteractorTest.kt" />
    </#if>

    <instantiate from="src/app_package/mvvm_rx/ViewModel.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/presentation/${featureName}ViewModel.kt" />
    
    <instantiate from="src/app_package/mvvm_rx/ViewState.kt.ftl"
                   to="${escapeXmlAttribute(srcOut)}/presentation/${featureName}ViewState.kt" />

    <instantiate from="res/layout/fragment.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/fragment_${classToResource(featureName)}.xml" />

    <instantiate from="test/app_package/mvvm_rx/ViewModelTest.kt.ftl"
    		 to="${escapeXmlAttribute(unitTestOut)}/presentation/${featureName}ViewModelTest.kt" />

    <open file="${escapeXmlAttribute(resOut)}/layout/fragment_${classToResource(featureName)}.xml" />
    <open file="${escapeXmlAttribute(srcOut)}/presentation/${featureName}ViewState.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/presentation/${featureName}Fragment.kt" />
    <open file="${escapeXmlAttribute(srcOut)}/presentation/${featureName}ViewModel.kt" />
    <open file="${escapeXmlAttribute(unitTestOut)}/presentation/${featureName}ViewModelTest.kt" />
</recipe>
