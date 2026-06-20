import { useLanguage } from '../../hooks/useLanguage'
import { useTranslatedText } from '../../hooks/useTranslatedText'
import './styles/QuickInfo.css'

function InfoRow({ emphasized = false, label, value }) {
  return (
    <div
      className={
        emphasized
          ? 'quick-info__row quick-info__row--emphasized'
          : 'quick-info__row'
      }
    >
      <dt>{label}:</dt>
      <span className="quick-info__leader" aria-hidden="true" />
      <dd>{value ?? '-'}</dd>
    </div>
  )
}

function QuickInfo({ patrimonio }) {
  const { language, t } = useLanguage()
  const isCultural = patrimonio.tipo?.toLowerCase() === 'cultural'
  const translatedStyle = useTranslatedText(
    patrimonio.cultural?.epoca,
    language,
  )
  const translatedCenturies = useTranslatedText(
    patrimonio.cultural?.anio,
    language,
  )
  const translatedEcosystem = useTranslatedText(
    patrimonio.natural?.ecosistema,
    language,
  )

  return (
    <section className="quick-info" aria-labelledby="quick-info-title">
      <h2 id="quick-info-title">{t('heritageDetail.quickInfo')}</h2>
      <dl>
        <InfoRow
          label={t('heritageDetail.type')}
          value={t(`heritageDetail.types.${patrimonio.tipo?.toLowerCase()}`)}
        />
        <InfoRow
          label={t('heritageDetail.community')}
          value={patrimonio.provincia?.comunidad}
        />
        <InfoRow
          label={t('heritageDetail.province')}
          value={patrimonio.provincia?.nombre}
        />
        {isCultural ? (
          <>
            <InfoRow
              emphasized
              label={t('heritageDetail.style')}
              value={translatedStyle}
            />
            <InfoRow
              emphasized
              label={t('heritageDetail.centuries')}
              value={translatedCenturies}
            />
          </>
        ) : (
          <>
            <InfoRow
              emphasized
              label={t('heritageDetail.ecosystem')}
              value={translatedEcosystem}
            />
            <InfoRow
              emphasized
              label={t('heritageDetail.extension')}
              value={
                patrimonio.natural?.extension !== undefined
                  ? `${patrimonio.natural.extension} km²`
                  : '-'
              }
            />
          </>
        )}
      </dl>
    </section>
  )
}

export default QuickInfo
